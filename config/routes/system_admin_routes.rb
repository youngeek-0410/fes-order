# ==============================================================================
# config - routes - system_admin
# ==============================================================================
Rails.application.routes.draw do
  namespace :system_admin do
    root to: 'shops#index', as: :root
    get 'sign_in', to: 'sessions#new', as: :new_session
    post 'sign_in', to: 'sessions#create', as: :session
    delete 'sign_out', to: 'sessions#destroy', as: :destroy_session

    resources :shops, only: [:index, :create, :new, :destroy]
  end
end
