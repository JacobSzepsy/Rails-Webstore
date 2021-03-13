Rails.application.routes.draw do
  resources :transcations
  resources :items
  resources :users

  get 'admin', to: 'admin#index'
  get '/login', to: 'session#login'
  get '/register', to: 'session#register'
  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
