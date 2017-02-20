Rails.application.routes.draw do
  
  get 'home/new'


  get '/login' => 'login#login'
  get 'login/new'


  get "signup" => "login#new", :as => "signup"
  root 'home#new'
  resources :users

  get '/activities' => 'activities#home'
  get '/home' => 'home#new'

end
