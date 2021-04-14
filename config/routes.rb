Rails.application.routes.draw do
  # resources :comments
  # resources :watch_stocks
  # resources :watchlists
  # resources :stocks
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/stocks/:symbol', to: 'stocks#show'
  get '/stockdata/:symbol', to: 'stocks#data'
  get 'similarstock/:symbol', to: 'stocks#similar'
  get '/batch/:symbols', to: 'stocks#batch'
  get '/chartdata/:symbol', to: 'stocks#chart'

  post '/users/login', to: 'users#login'
  post '/users/signup', to: 'users#signup'
  patch '/users/:id', to: 'users#update'

  # post with watchlist id ? in order to identify which list to add the new stock to?
  post '/addtowatchlist/:id', to: 'watch_stocks#add'


  post '/newlist', to: 'watchlists#create'
  delete '/deleteList/:id', to: 'watchlists#delete'

end
