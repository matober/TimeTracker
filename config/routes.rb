Rails.application.routes.draw do
  
  get 'home/new'

  get '/login' => 'login#login'
  get 'login/new'

  get 'activities/new'
  get 'activities/new.html.erb' => 'activities#new'
  get '/activities' => 'activities#display'
  get 'activities/display'

  post 'activities/create'

  delete 'add_activities_path', to: 'activities#new', as: :new

  get 'categories/new' => 'categories#new'
  get 'categories/display' => 'categories#display'

  get 'signup' => 'login#new', :as => 'signup'

  get '/activities/create' => 'activities#create', :as => :create_activities

  root 'home#new'

  resources :users
  resources :activities
  resources :categories

end
