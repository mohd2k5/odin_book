Rails.application.routes.draw do
  get "users/show"
  devise_for :users

  authenticated :user do
    root "posts#index", as: :authenticated_root
  end

  unauthenticated do
    devise_scope :user do
      root "devise/sessions#new"
    end
  end

  resources :posts
  resources :users, only: [:index, :show]

  resources :posts do
    resource :like, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :follows, only: [:create, :destroy] do
    member do
      patch :accept
      patch :reject
    end
  end
end