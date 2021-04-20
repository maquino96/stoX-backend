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
  get '/treemapdata', to: 'stocks#treemap'
  get '/news/:symbols', to: 'stocks#news'
  get '/alt/:symbol', to: 'stocks#alt'

  post '/users/login', to: 'users#login'
  post '/users/signup', to: 'users#signup'
  patch '/users/:id', to: 'users#update'

  # post with watchlist id ? in order to identify which list to add the new stock to?
  post '/addtowatchlist/:id', to: 'watch_stocks#add'
  delete '/watchstock/:list/:symbol', to: 'watch_stocks#delete'

  get '/watchlists/all', to: 'watchlists#index'
  post '/newlist', to: 'watchlists#create'
  patch '/watchlists/:id', to: 'watchlists#update'
  patch '/watchlist/upvote/:id', to: 'watchlists#upvote'
  delete '/deleteList/:id', to: 'watchlists#delete'


end
