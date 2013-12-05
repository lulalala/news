Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, AppConfig.facebook.app_id, AppConfig.facebook.app_secret
end
