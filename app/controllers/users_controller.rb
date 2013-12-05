class UsersController < ApplicationController
  load_and_authorize_resource

  # profile
  def show
    if @user.identities.empty?
      redirect_to root_url and return
    end
  end
end
