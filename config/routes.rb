Rails.application.routes.draw do
  
  #Set default page to home page
  root 'home#home'

  # Activity Routes
  get '/activities' => 'activities#home'
  post '/activities/:id' => 'activities#set_hidden_true'
  post 'Unhide All' => 'activities#unhide_all'
  put '/activities/:id' => 'activities#update'
  #post 'update_activity' => 'activities#update'
  get 'activities/:id/edit' => 'activities#edit'
  get 'edit activity' => 'activities#edit'
  resources :activities

  #Category Routes
  resources :categories
  get '/categories/:id' => 'categories#show'

  #User Routes
  resources :users, only: [:new, :create]
  get '/sign_up', to: 'users#new', as: :sign_up

  #User Session Routes
  resources :user_sessions, only: [:create, :destroy]

  #Misc. Routes
  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in

  #Home Routes
  get '/home/index' => 'home#index'
  get '/home' => 'home#home', as: :home
  get '/welcome' => 'home#welcome'
  post  '/home/activity' => 'home#create_activity', as: :create_act
  post '/home/category' => 'home#create_category', as: :create_cat
  post 'home/set_hide/:id' => 'home#hide_activity', as: :hide_act

  delete '/activity_delete/:id' => 'home#delete_activity', as: :delete_act


end
