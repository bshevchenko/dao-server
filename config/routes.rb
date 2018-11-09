Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    # confirmations:      'devise_token_auth/confirmations',
    # passwords:          'devise_token_auth/passwords',
    # omniauth_callbacks: 'devise_token_auth/omniauth_callbacks',
    # registrations:      'overrides/registrations',
    # sessions:           'devise_token_auth/sessions',
    # token_validations:  'overrides/token_validations',
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/test', to: "proposals#test"
  get '/user/details', to: "user#details"
  post '/user/new', to: "user#new_user"
  # get '/token', to: "proposals#test_token"
  get '/get_challenge', to: "authentication#challenge"
  get '/prove', to: "authentication#prove"

  post '/transactions/confirmed', to: "transactions#confirmed"
  post '/transactions/latest', to: "transactions#latest"
  post '/transactions/new', to: "transactions#new"
  post '/transactions/list', to: "transactions#list"
  post '/transactions/status', to: "transactions#status"
end