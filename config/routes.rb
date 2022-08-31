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
      
      
      get "/orders/comfirm" => "orders#comfirm"
      post "/orders/comfirm" => "orders#comfirm"
      post "/orders/thanks" => "orders#thanks"
      get "/orders/show" => "orders#show"
      resources :orders, only: [:index, :new, :create]
      
      resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    end
    
    # admin
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
      sessions: "admin/sessions"
    }
    
    namespace :admin do
      resources :genres, only: [:index, :create, :edit, :update]
      resources :items
      resources :customers, only: [:index, :show, :edit, :update]
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
