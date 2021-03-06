Rails.application.routes.draw do
 
  root :to => 'pages#home'
  
  get '/users/momentshow' => 'users#momentshow'

  resources :locations
  resources :users
  resources :moments
  resources :likes, only: [:create]
  resources :fireworks, only: [:create]

# Find users based on location and and absence of a match

  get '/users/:id/match' => 'users#match', as: :match
  post '/users/update_profile_pic' => 'users#update_profile_pic'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'

  match 'auth/:provider/callback', to: 'session#create_fb', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'session#destroy', as: 'signout', via: [:get, :post]
  
  resources :conversations do
    resources :messages
  end
  


end
