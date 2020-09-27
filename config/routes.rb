Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'stacks#index'

  resources :stacks do
    member do
      patch :edit
    end
  end

  get '/home/howto', to: 'homes#howto' 
  get '/home/terms', to: 'homes#terms' 
  get '/home/policy', to: 'homes#policy' 
end
