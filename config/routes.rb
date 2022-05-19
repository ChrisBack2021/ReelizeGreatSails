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




  get '/payments/success/:reel_id', to: 'payments#success'
 

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
# root "articles#index"

  root 'reels#index'

  
end
