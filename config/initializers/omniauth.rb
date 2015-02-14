Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :gitlab, ENV['GITLAB_KEY'], ENV['GITLAB_SECRET'],
    client_options: {
      site: 'http://git.geocens.ca',
      authorize_url: '/oauth/authorize',
      token_url: '/oauth/token'
    }
end
