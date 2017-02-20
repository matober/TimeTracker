Rails.application.routes.draw do
  
  get 'home/new'

  get 'login/new'

  get 'activities/new'

  get 'activities/display'

  get 'signup' => 'login#new', :as => 'signup'
  root 'home#new'

  resources :users
  resources :activities

end
