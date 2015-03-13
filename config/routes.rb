Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :map_notes

  namespace :admin do
    resources :map_notes
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'

  get "/pages/*id" => 'pages#show', as: :page, format: false

  root to: "pages#show", id: "main"
end
