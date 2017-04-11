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


  get '/pages/index' => 'pages#index'

  #User Routes
  resources :users, only: [:new, :create]

  #User Session Routes
  resources :user_sessions, only: [:create, :destroy]

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in

  #Home Routes
  get '/home/index' => 'home#index'


  resources :categories
  resources :activities do
    patch :set_hidden_true, on: :member
  end

end
