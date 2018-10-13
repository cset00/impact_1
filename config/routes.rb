Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'admin_users#login'

  resources :events
  post '/events/:id/cancel', to: 'events#cancel'
  
end
