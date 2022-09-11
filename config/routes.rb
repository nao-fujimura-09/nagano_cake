Rails.application.routes.draw do

    root to: "public/homes#top"  
    get "/about" => "public/homes#about", as:"about"
    
    # customer
    devise_for :customers, skip: [:passwords],  controllers: {
      registrations: "public/registrations",
      sessions: "public/sessions"
    }
    
    scope module: :public do
    # namespace :public do
      resource :customers, only: [:show]
      get "/customers/information/edit" => "customers#edit"
      patch "/customers/information" => "customers#update"
      get "/customers/comfirm" => "customers#comfirm"
      patch "/customers/withdrawal" => "customers#withdrawal"
      
      resources :items, only: [:index, :show]
      resources :cart_items, only: [:index, :create, :update, :destroy]
      delete "/cart_items/" => "cart_items#destroy_all"
      
      post "/orders/comfirm" => "orders#comfirm"
      get "/orders/thanks" => "orders#thanks", as:"thanks" #名前をつけることで詳細にリンクするバグを回避
      resources :orders, only: [:index, :new, :create, :show]
      
      resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    end
    
    # admin
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
      sessions: "admin/sessions"
    }
    
    namespace :admin do
      resources :genres, only: [:index, :create, :edit, :update]
      resources :items
      resources :customers, only: [:index, :show, :edit, :update] do
      resources :orders, only: [:index]
      end
      resources :orders, only: [:index, :show, :update]
      resources :order_detail, only: [:update]
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
