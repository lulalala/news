class Article::ReviewsController < ApplicationController
  load_and_authorize_resource class:'Article::Review'

  def new
    if params[:line_id]
      @line = Article::Line.find(params[:line_id])
    end
  end

  def edit
  end

  def create
    line = Article::Line.find(params[:line_id])
    @review.reviewable = line
    if @review.save
      redirect_to review_article_path(params[:article_id])
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end
end
