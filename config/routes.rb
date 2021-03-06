Rails.application.routes.draw do

devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'
  get '/'  => 'homes#index'
  get 'home/about'  => 'homes#about'
resources :users, only: [:index, :show, :create, :edit, :update, :destroy]
resources :books, only: [ :index, :new, :show, :create, :edit, :update, :destroy ]


get '*path', controller: 'application', action: 'render_404'

end
