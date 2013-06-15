module CanCan
  module ControllerAdditions
    alias original_cancan_authorize! authorize!
    private :original_cancan_authorize!

    # Override to
    def authorize!(*args)
      begin
        original_cancan_authorize!(*args)
      rescue CanCan::AccessDenied
        if current_user.nil?
          authenticate_user! # devise
        else
          raise
        end
      end
    end
  end
end
