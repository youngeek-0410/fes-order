# ==============================================================================
# config - routes
# ==============================================================================
Rails.application.routes.draw do
  root to: 'shops#index', as: :root

  get 'sign_in', to: 'sessions#new', as: :new_session
  post 'sign_in', to: 'sessions#create', as: :session
  delete 'sign_out', to: 'sessions#destroy', as: :destroy_session

  resources :users, except: :index do
    resources :coupons, only: [:index, :create], controller: :coupons
  end

  resources :shops, only: [:index, :show] do
    resources :products, only: :show, controller: :products
  end

  resources :receipts, only: [:index, :show, :create] do
    post 'to_used', on: :member
  end

  resources :game_tickets, only: [:index, :show]
end
