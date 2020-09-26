Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'stacks#index'
  # get 'stacks/success', to: redirect('/')

  resources :stacks do
    member do
      patch :edit
    end
    collection do
      get :howto
    end
  end
end
