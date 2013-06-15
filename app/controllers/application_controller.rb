class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :prepare_unobtrusive_flash

  check_authorization :unless => :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to request.referer, :alert => exception.message
  end

  before_filter :store_current_location, :unless => :devise_controller?
  def store_current_location
    session["user_return_to"] = request.url
  end
end
