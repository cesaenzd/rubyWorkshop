Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "events#index"

  resources :events
  resources :users
  
  get 'events/:id/register', to: 'events#register', as: 'register_to_event'
  post 'events/:id/register', to: 'events#register_user', as: 'register_user'
end
