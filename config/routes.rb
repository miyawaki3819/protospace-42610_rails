Rails.application.routes.draw do
  devise_for :users, skip: [:confirmations, :passwords], controllers: { registrations: "users/registrations" }
  root "prototypes#index"
  resources :prototypes do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
  mount ActiveStorage::Engine => "/rails/active_storage"
end
