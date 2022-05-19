Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :reels

  get '/profiles', to: 'profiles#index'
  get '/profiles/:id/edit', to: 'profiles#edit', as: 'edit_profile'
  post '/profiles/:id/edit', to: 'profiles#update'
  get 'profiles/:id', to: 'profiles#show', as: 'profile'
  delete '/profiles/:id', to: 'profiles#destroy'

  post 'reels/add_to_wish_list/:id', to: 'reels#add_to_wish_list', as: 'add_to_wish_list'
  delete 'reels/remove_from_wish_list/:id', to: 'reels#remove_from_wish_list', as: 'remove_from_wish_list'


  get '/payments/success/:reel_id', to: 'payments#success'
 

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
# root "articles#index"

  root 'reels#index'

  
end
