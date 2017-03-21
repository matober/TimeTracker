Rails.application.routes.draw do
  
  get 'home/new'

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
  root 'home#new'

  resources :users
  resources :activities

end
