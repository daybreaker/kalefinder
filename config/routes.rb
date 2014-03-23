Kalefinder::Application.routes.draw do
  #root "pages#home"    
  #get "home", to: "pages#home", as: "home"
  #get "inside", to: "pages#inside", as: "inside"

  root "packages#index"

  devise_for :users

  resources :places do
    put 'score/:package_id', action: :score, on: :member, as: 'score'
  end

  resources :packages

  namespace :admin do
    root "base#index"
    resources :users
  end

end
