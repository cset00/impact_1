Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepage#index'

  resources :reg_users, only: [:index, :show, :new, :create]
  
  resources :admin_users, only: [:index, :show, :new, :create]
  get '/login', to:'admin_users#new'
  post '/login', to:'admin_users#new'

  get    '/sessions/new',   to: 'sessions#new'
  post   '/sessions',   to: 'sessions#create'
  delete '/sessions',  to: 'sessions#destroy'

  resources :events
  post '/events/:id/cancel', to: 'events#cancel'
  
  resources :rsvps, only: [:destroy, :create, :new]
  get   '/rsvps/:id/cancel', to: 'rsvps#cancel'
  
end
