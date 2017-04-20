Rails.application.routes.draw do
  
  #Set default page to home page
  root 'home#home'

  # Activity Routes
  get '/edit_activity/:id' => 'activities#edit_activity', as: :edit_act
  delete '/delete_activity/:id' => 'activities#destroy_activity', as: :destroy_act
  post  '/create_activity' => 'activities#create_activity', as: :create_act
  post '/activity/set_hide/:id' => 'activities#hide_activity', as: :hide_act
  post '/activity/unhide' => 'activities#unhide_activity', as: :unhide_act
  patch 'activity/update_act/:id' => 'activities#update_activity', as: :update_act

  get 'activities/new'
  get 'activities/new.html.erb' => 'activities#new'
  get '/activities' => 'activities#display'
 

  #Category Routes
  get '/edit_category/:id' => 'categories#edit_category', as: :edit_cat
  delete '/delete_category/:id' => 'categories#destroy_category', as: :destroy_cat
  post  '/create_category' => 'categories#create_category', as: :create_cat
  post '/unhide_cat_activites/:id' => 'categories#unhide_cat_activities', as: :unhide_cat
  patch 'activity/update_cat/:id' => 'categories#update_category', as: :update_cat

  #User Routes
  resources :users, only: [:new, :create]
  get '/users', to: 'users#new', as: :sign_up

  #User Session Routes
  resources :user_sessions, only: [:create, :destroy]

  #Misc. Routes
  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/user_sessions', to: 'user_sessions#new', as: :sign_in

  #Home Routes
  get '/home/index' => 'home#index'
  get '/home' => 'home#home', as: :home
  get '/welcome' => 'home#welcome'

  resources :home do
    put :sort, on: :collection
  end


end
