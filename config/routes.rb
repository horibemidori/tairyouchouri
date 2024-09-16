Rails.application.routes.draw do


  devise_for :admins, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy, :show]
    resources :comments, only: [:index, :destroy]
  end
  
  
  


  scope module: :public do
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
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
