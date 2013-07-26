class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :prepare_unobtrusive_flash

  check_authorization :unless => :do_not_check_authorization?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to request.referer, :alert => exception.message
  end
  def do_not_check_authorization?
    respond_to?(:devise_controller?) or
    self.class == HighVoltage::PagesController
  end

  before_filter :store_current_location, :unless => :devise_controller?
  def store_current_location
    session["user_return_to"] = request.url
  end
end

# To redefine current_user
class ApplicationController < ActionController::Base
  def self.method_added(method_name)
    if instance_methods.include?(:current_user) && !instance_methods.include?(:devise_current_user)
      redefine_current_user()
    end
  end
  def self.redefine_current_user
    alias_method :devise_current_user, :current_user
    define_method :current_user do
      user = devise_current_user
      if !user && !devise_controller?
        # Guest user
        user = User.find(100)
      end
      return user
    end
  end
end
