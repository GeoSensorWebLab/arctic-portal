require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
  provider :openid,
           store: OpenID::Store::Filesystem.new('tmp/store')
  provider :developer unless Rails.env.production?
  provider :gitlab, ENV['GITLAB_KEY'], ENV['GITLAB_SECRET'],
    client_options: {
      site: 'http://git.geocens.ca',
      authorize_url: '/oauth/authorize',
      token_url: '/oauth/token'
    }
end
