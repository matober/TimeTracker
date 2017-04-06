Rails.application.routes.draw do

  root 'activities#home'
  # Direct to login page
  get '/login' => 'login#login'

  # Direct to sign up page
  get 'login/new'

  #TODO
  get "signup" => "login#new", :as => "signup"
  root 'home#new'
  resources :users

  # Direct to activities page
  get '/activities' => 'activities#home'
  get '/jsTest' => 'activities#JSloadMethod'
  get '/activities/list' =>'activities#index'

  # TODO
  get '/home' => 'home#new'

  post '/activities/:id' => 'activities#set_hidden_true'
  post 'Unhide All' => 'activities#unhide_all'

  resources :categories
  resources :activities

#   do
#   patch :set_hidden_true, on: :member
# end


end
