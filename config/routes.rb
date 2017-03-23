Rails.application.routes.draw do

<<<<<<< HEAD
  get '/login' => 'login#login'
  get 'login/new'

  get 'activities/new'
  get 'activities/new.html.erb' => 'activities#new'
  get '/activities' => 'activities#display'
  put 'activities/increment' => 'activities#increment'
  put 'activities/decrement' => 'activities#decrement'

  delete 'add_activities_path', to: 'activities#new', as: :new

  get 'activities/display'

  get 'signup' => 'login#new', :as => 'signup'
=======
  # Direct to login page
  get '/login' => 'login#login'

  # Direct to sign up page
  get 'login/new'

  #TODO
  get "signup" => "login#new", :as => "signup"
>>>>>>> cd84a5d73a4862dec852b95d742ee0061a298f2f
  root 'home#new'

  resources :users
  resources :activities

  # Direct to activities page
  get '/activities' => 'activities#home'
  get '/activities/list' =>'activities#index'

  # TODO
  get '/home' => 'home#new'

  resources :categories
  resources :activities

end
