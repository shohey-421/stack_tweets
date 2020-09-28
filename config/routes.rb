Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'stacks#index'

  resources :stacks do
    member do
      patch :edit
    end
  end

  get '/howto', to: 'homes#howto' 
  get 'terms', to: 'homes#terms' 
  get 'policy', to: 'homes#policy' 
end
