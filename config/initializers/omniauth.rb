require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :browser_id
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :openid,
           store: OpenID::Store::Filesystem.new('tmp/store')
  provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"]

  unless Rails.env.production?
    provider :developer
    provider :gitlab, ENV['GITLAB_KEY'], ENV['GITLAB_SECRET'],
      client_options: {
        site: 'http://git.geocens.ca',
        authorize_url: '/oauth/authorize',
        token_url: '/oauth/token'
      }
  end
end
