Rails.application.routes.draw do
  
  
  devise_for :admins
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
  end
  esources :users, only: [:destroy]
  devise_for :users
  root to: "homes#top"
  get 'homes/about'
  get 'users/mypage'
  
  resources :recipes, only: [:new, :create, :index, :show, :edit, :update, :destroy] do 
   resource :favorite, only: [:create, :destroy]
   resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:mypage, :edit, :show, :update, :destroy] do
    resources :favorite, only:[:index]
  end
  
  get '/search', to: 'searches#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
