Rails.application.routes.draw do
  resources :emails
  devise_for :users
  root "emails#index" 
  resources :groups
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
