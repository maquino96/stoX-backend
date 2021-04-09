Rails.application.routes.draw do
  # resources :comments
  # resources :watch_stocks
  # resources :watchlists
  # resources :stocks
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/stocks/:symbol', to: 'stocks#show'
  get '/stockdata/:symbol', to: 'stocks#data'

end
