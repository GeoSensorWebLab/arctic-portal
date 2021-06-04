require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :openid,
           store: OpenID::Store::Filesystem.new('tmp/store')
  provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"]

  unless Rails.env.production?
    provider :developer
  end
end
