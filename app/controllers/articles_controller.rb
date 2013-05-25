class ArticlesController < ApplicationController
  def index
    @articles = Article.order('id DESC').page(params[:page])
  end

  def create
    url = params[:url]
    fetcher = Fetcher.applicable_fetcher(url)

    # Use article if already fetched before
    if @article = fetcher.find_existing(url)
      redirect_to review_article_path(@article) and return
    end

    begin
      @article = fetcher.fetch
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
    rescue
      if Rails.env.development?
        raise # debugging
      end
      flash[:error] = '抱歉，這篇新聞還無法自動抓取，已經通知站長，將會找時間改進。'
      redirect_to action: :index and return
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  # GET
  def review
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article, :notice  => "Successfully updated article."
    else
      render :action => 'edit'
    end
  end
end
