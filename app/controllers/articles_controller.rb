class ArticlesController < ApplicationController
  load_and_authorize_resource

  def index
    @articles = @articles.where{line_reviews_count != 0}.order('id DESC').page(params[:page])
  end

  def create
    url = params[:url]
    if !url.ascii_only?
      url = URI.encode(url)
    end

    parser = TaiwaneseNewsParser.new(url)

    if parser.nil?
      raise NewsSucks::ParserNotExistError
    elsif ( parser.article[:web_domain].blank? ||  parser.article[:url_id].blank? )
      raise # debugging
    end

    # Use article if already fetched before
    if @article = Article.find_existing(parser.article[:web_domain], parser.article[:url_id])
      redirect_to review_article_path(@article) and return
    end

    hash = parser.parse

    @article = Article.new(hash.except(:web_domain, :url_id, :reproduced))
    @article.web_domain = hash[:web_domain]
    @article.url_id = hash[:url_id]

    if @article.save
      redirect_to review_article_path(@article)
    else
      puts @article.errors[:base].inspect
      puts @article.valid?
      if @article.errors[:base].find{|e| e.include?('新聞轉載')}
        render :reproduced and return
      end
      redirect_to @article
    end
  rescue Exception => e
    logger.parser.error(params[:url])
    logger.parser.error(e.inspect)
    if Rails.env.development?
      raise
    elsif e.is_a? NewsSucks::ParserNotExistError
      flash[:error] = '抱歉，目前還沒辦法抓取這個網站的內容。中國時報只能抓新版網站，東森新聞只能抓 Ettoday。'
      redirect_to action: :index
    else
      flash[:error] = '抱歉，這篇新聞抓取時發生問題，已經通知站長，預計一週內會修復。'
      redirect_to action: :index
    end
  end

  def show
  end

  # GET
  def review
    ActiveRecord::Associations::Preloader.new(@article,:lines => :reviews).run()
  end

  def update
    if @article.update_attributes(params[:article])
      redirect_to @article, :notice  => "Successfully updated article."
    else
      render :action => 'edit'
    end
  end
end
