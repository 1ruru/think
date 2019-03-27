Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create, :edit, :update, :destroy] do
    resources :chats, only: [:index, :create, :update]
  end
end
