Rails.application.routes.draw do
  devise_for :users
  root to: "chats#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create, :edit, :update,:delete] do
  resources :chats, only: [:index, :create]
  end
end
