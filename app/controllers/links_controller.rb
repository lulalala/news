class LinksController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @link = @article.links.build
  end

  def create
    @article = Article.find(params[:article_id])
    @link = @article.links.create(params[:link])
    redirect_to review_article_path(@article)
  end
end
