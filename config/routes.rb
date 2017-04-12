Rails.application.routes.draw do
  
  #Set default page to home page
  root 'home#home'

  # Activity Routes
  get '/activities' => 'activities#home'
  resources :activities do
    patch :set_hidden_true, on: :member
  end

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
end
