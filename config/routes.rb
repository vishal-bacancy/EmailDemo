Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :emails do
    member do 
      get "update_important_emails"
    end
    collection do
      get "important_emails"
    end
  end
  devise_for :users
  root "emails#index" 
  resources :groups
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
