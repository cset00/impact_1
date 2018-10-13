Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/login', to: 'admin_users#login'

  resources :reg_users, only: [:index, :show, :new, :create]
  get '/login', to:'admin_users#login'
  get '/signup', to:'admin_users#new'
  post '/create_user', to:'admin_users#create'

  resources :events
  post '/events/:id/cancel', to: 'events#cancel'
  


end
