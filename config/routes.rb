Rails.application.routes.draw do


  devise_for :admins, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy, :show]
    resources :recipes, only: [:show]
    resources :comments, only: [:index, :destroy]
    resources :groups, only: [:index, :show, :destroy]
  end


  scope module: :public do
   devise_for :users
   root to: "homes#top"
   get 'homes/about'
   get 'users/mypage'

   devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
   end

   resources :recipes, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
   end
   resources :users, only: [:mypage, :edit, :show, :update, :destroy] do
    member do
    get :favorites
    end
   end

   get '/search', to: 'searches#search'
   resources :groups, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :request, only:[:create, :destroy]
    resource :group_member, only:[:create, :destroy]
   end
   get "groups/:id/requests" => "groups#requests", as: 'requests'
 end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
