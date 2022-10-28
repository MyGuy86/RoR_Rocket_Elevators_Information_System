Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  post '/quote', to: 'quotes#create'

  get 'pages/index'
=======
 
post '/quotes', to: 'quotes#create'

>>>>>>> 68830be8c8ffd5fbe43a46539365623154f92a30
root 'pages#index'

get '/index', to: 'pages#index'

get '/commercial', to: 'pages#commercial'

get '/quotes', to: 'pages#quotes'

get '/residential', to: 'pages#residential'







end

