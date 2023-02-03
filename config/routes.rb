Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :deus do
    resources :likes, only: [:create, :destroy]
  end
  root 'deus#index'
  
  get 'users/like/:id' => 'users#like', as:'user_like'
  


end
