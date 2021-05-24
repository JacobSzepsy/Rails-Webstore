Rails.application.routes.draw do
  resources :transcations
  resources :items
  resources :cart

  get 'login', to: 'login#login'
  post 'login', to: 'login#create'
  get 'checkout', to: 'checkout#index'
  post 'checkout', to: 'checkout#create'
  get 'checkout/success', to: 'checkout#success'

  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
