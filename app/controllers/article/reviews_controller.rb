class Article::ReviewsController < ApplicationController
  load_and_authorize_resource class:'Article::Review'

  def new
    if params[:line_id]
      line = Article::Line.find(params[:line_id])
      @review.reviewable = line
    end
  end

  def edit
  end

  def create
    if @review.save
      redirect_to review_article_path(@review.reviewable.article)
    else
      logger.debug @review.errors
      #flash[:error] = @review.tags.map{|t| t.errors.full_messages}
      render :new
    end
  end

  def update
  end

  def destroy
  end
end
