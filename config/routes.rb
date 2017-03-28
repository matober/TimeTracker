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
  get '/jsTest' => 'activities#JSloadMethod'
  get '/activities/list' =>'activities#index'

  # TODO
  get '/home' => 'home#new'


  resources :categories
  resources :activities

end
