class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :prepare_unobtrusive_flash

  check_authorization :unless => :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => exception.message
  end
end
