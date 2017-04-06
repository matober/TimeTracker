Rails.application.routes.draw do
  
  get 'home/new'

  root 'activities#home'
  # Direct to login page
  get '/login' => 'login#login'

  # Direct to sign up page
  get 'login/new'

  get "signup" => "login#new", :as => "signup"
  root 'home#new'
  resources :users

  # Direct to activities page
  get '/activities' => 'activities#home'
  get '/activities/list' =>'activities#index'
  get '/activities/:id' => 'activities#show'
  get '/activities/edit/:id' => 'activities#edit', :as => 'edit_activity'

  # TODO
  get '/home' => 'home#new'

  get '/categories/:id' => 'categories#show'

  #User Routes
  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:create, :destroy]

  resources :categories
  resources :activities do
    patch :set_hidden_true, on: :member
  end

end
