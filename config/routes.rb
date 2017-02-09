Rails.application.routes.draw do
  get 'home/new'

  get 'login/new'

  get "signup" => "login#new", :as => "signup"
  root 'home#new'
  resources :users
end
