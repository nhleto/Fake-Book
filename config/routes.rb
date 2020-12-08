Rails.application.routes.draw do
  # resources :comments
  devise_scope :user do
    unauthenticated :user do
      root to: 'devise/sessions#new'
    end
  end

  authenticated :user do
    root to: 'posts#index'
  end

  devise_for :users

  # resources :groups, only: %i[new create destroy show] do
  #   resources :posts do
  #     member do
  #       post 'like'
  #       delete 'unlike'
  #     end
  #   end
  #   resources :comments do
  #     member do
  #       post 'like'
  #       delete 'unlike'
  #     end
  #   end
  # end

  resources :groups, only: %i[new create destroy show]

  resources :users
  resources :friendships, only: %i[create destroy]
  resources :posts do
    member do
      post 'like'
      delete 'unlike'
    end
  end

  resources :comments do
    member do
      post 'like'
      delete 'unlike'
    end
  end
end
