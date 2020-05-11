Rails.application.routes.draw do

devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'
  get 'homes'  => 'homes#index'
  get 'show'  => 'homes#show'
resources :users, only: [:index, :show, :create, :edit, :update, :destroy]
resources :books, only: [ :index, :new, :show, :create, :edit, :update, :destroy ]
end
