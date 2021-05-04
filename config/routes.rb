# ==============================================================================
# config - routes
# ==============================================================================
Rails.application.routes.draw do
  root to: 'shops#index', as: :root

  get 'sign_in', to: 'sessions#new', as: :new_session
  post 'sign_in', to: 'sessions#create', as: :session
  delete 'sign_out', to: 'sessions#destroy', as: :destroy_session

  resource :user do
    resources :coupons, only: [:index, :create], controller: :coupons
    resources :game_tickets, only: [:index, :show], controller: :game_tickets
    resources :receipts, only: [:index, :show, :create], controller: :receipts do
      post 'to_used', on: :member
    end
  end

  resources :shops, only: [:index, :show] do
    resources :products, only: :show, controller: :products
  end


  resources :quizzes, only: :index
end
