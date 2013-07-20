class ArticlesController < ApplicationController
  load_and_authorize_resource

  def index
    @articles = @articles.order('id DESC').page(params[:page])
  end

  def create
    url = params[:url]
    parser = TaiwaneseNewsParser.new(url)

    # Use article if already fetched before
    if @article = Article.find_existing(parser.article[:web_domain], parser.article[:url_id])
      redirect_to review_article_path(@article) and return
    end

    begin
      hash = parser.parse
    rescue
      if Rails.env.development?
        raise # debugging
      end
      flash[:error] = '抱歉，這篇新聞抓取時發生問題，已經通知站長，預計一週內會修復。'
      redirect_to action: :index and return
    end

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
  end

  def show
  end

  # GET
  def review
  end

  def update
    if @article.update_attributes(params[:article])
      redirect_to @article, :notice  => "Successfully updated article."
    else
      render :action => 'edit'
    end
  end
end
