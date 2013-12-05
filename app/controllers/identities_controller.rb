# Based on https://github.com/intridea/omniauth/wiki/Managing-Multiple-Providers
class IdentitiesController < ApplicationController
  load_and_authorize_resource except:[:create]

  skip_before_filter :verify_authenticity_token, only: :create

  def index
  end

  # Must be signed in
  def create
    if current_user.nil?
      raise CanCan::AccessDenied.new("沒有登入")
    end

    auth = request.env['omniauth.auth']
    # Find an identity here
    @identity = Identity.find_with_omniauth(auth)

    if @identity
      if @identity.user != current_user
        logger.error("Identity #{@identity.id}'s user is not User #{current_user.id}")
        flash[:error] = '連結失敗，這個帳號已經連結到另一個使用者了。如有問題請通知站長處理。'
      else
        flash[:notice] = '已經連結成功'
      end
    else # identity not found
      @identity = Identity.create_with_omniauth(auth)
      @identity.user = current_user
      @identity.save()
      flash[:notice] = '連結成功'
    end
    redirect_to root_url
  end

  def destroy
    @identiy.destroy
    redirect_to identities_path, notice: "刪除成功"
  end
end
