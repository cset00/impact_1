Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepage#index'

  resources :reg_users, except: [:destroy]
  get   '/reg_users/:id/unsubscribe', to: 'reg_users#confirm_unsub'
  put   '/reg_users/:id/unsub', to: 'reg_users#unsub'
  
  resources :admin_users, only: [:index, :show, :new, :create]


  get    '/sessions/new',   to: 'sessions#new'
  post   '/sessions',   to: 'sessions#create'

  resources :events
  post '/events/:id/cancel', to: 'events#cancel'
  
  resources :rsvps, only: [:destroy, :create, :new]
  get   '/rsvps/:id/cancel', to: 'rsvps#cancel'
  
end
