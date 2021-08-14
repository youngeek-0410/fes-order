# ==============================================================================
# config - routes - management
# ==============================================================================
Rails.application.routes.draw do
  namespace :management do
    root to: 'shops#show', as: :root
    get 'sign_in', to: 'sessions#new', as: :new_session
    post 'sign_in', to: 'sessions#create', as: :session
    delete 'sign_out', to: 'sessions#destroy', as: :destroy_session

    resource :shop do
      resources :receipts, only: [:index, :show], controller: :receipts do
        post 'to_availabled', on: :member
      end
    end

    resources :products
  end
end
