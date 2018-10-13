Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :reg_users, only: [:index, :show, :new, :create]
  
  resources :admin_users, only: [:index, :show, :new, :create]
  get '/login', to:'admin_users#login'
  post '/login', to:'events#index'

  resources :events
  post '/events/:id/cancel', to: 'events#cancel'
  


end
