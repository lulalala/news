class ArticlesController < ApplicationController
  def index
    @articles = Article.page(params[:page])
  end

  def create
    url = params[:url]
    begin
      article = Fetcher::Udn.new(url).fetch
      if article.save
        redirect_to action: :index
      else
        redirect_to article
      end
    rescue
      flash[:error] = '抱歉，這篇新聞還無法自動抓取，已經通知站長，將會找時間改進。'
      redirect_to action: :index and return
    end
  end

  def show
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
