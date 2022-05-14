Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :reels


  get '/profiles', to: 'profiles#index'
  get '/profiles/:id/edit', to: 'profiles#edit', as: 'edit_profile'
  patch '/profiles/:id', to: 'profiles#update'
  post '/profiles/:id/edit', to: 'profiles#update'
  get '/profiles/:id/edit', to: 'profiles#show'

  post 'reels/add_to_cart/:id', to: 'reels#add_to_cart', as: 'add_to_cart'
  delete 'reels/remove_from_cart/:id', to: 'reels#remove_from_cart', as: 'remove_from_cart'

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
# root "articles#index"

  root 'reels#index'

  
end
