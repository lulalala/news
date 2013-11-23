class SuggestionsController < ApplicationController
  # GET /suggestions/new
  def new
    @suggestion = Suggestion.new

    if current_user && !current_user.guest?
      @suggestion.email = current_user.email
    end

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /suggestions
  def create
    @suggestion = Suggestion.new(params[:suggestion])

    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to root_url, notice: '謝謝您寶貴的意見，我們會儘快回覆您。' }
      else
        format.html { render action: "new" }
      end
    end
  end
end
