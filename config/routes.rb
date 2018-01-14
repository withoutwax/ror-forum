Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

  resources :posts do
    resource :likes, only: [:create, :destroy], module: :posts
    resources :comments, only: [:index, :create, :destroy], module: :posts
  end

end
