Kalefinder::Application.routes.draw do
  #root "pages#home"    
  #get "home", to: "pages#home", as: "home"
  #get "inside", to: "pages#inside", as: "inside"

  root "packages#new"

  get 'packages/', to: 'packages#new'
  get 'packages/:id', to: 'packages#show', as: 'package'

  devise_for :users

  resources :places

  namespace :admin do
    root "base#index"
    resources :users
  end

end
