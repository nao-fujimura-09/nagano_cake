Rails.application.routes.draw do

    root to: "public/homes#top"  
    get "/about" => "public/homes#about", as:"about"
    
    # customer
    devise_for :customers, skip: [:passwords],  controllers: {
      registrations: "public/registrations",
      sessions: "public/sessions"
    }
    
    namespace :public do
      resources :customers, only: [:show, :edit, :comfirm] 
      get 'customers/comfirm'
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
