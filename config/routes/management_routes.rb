# ==============================================================================
# config - routes - management
# ==============================================================================
Rails.application.routes.draw do
  namespace :management do
    get 'sign_in', to: 'sessions#new', as: :new_session
    post 'sign_in', to: 'sessions#create', as: :session
    delete 'sign_out', to: 'sessions#destroy', as: :destroy_session

    resource :shops do
      resources :receipts, only: [:index, :show, :to_availabled], controller: :receipts do
        post 'Receipt.availabled', on: :member
      end
    end
  end
end

