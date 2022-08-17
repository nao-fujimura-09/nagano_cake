Rails.application.routes.draw do

  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
    root to: "public/homes#top"  
    get "/about" => "public/homes#about", as:"about"
    
# customer
devise_for :customers, skip: [:passwords],  controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
}

# admin
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  resources :genres, only: [:index, :create, :edit, :update]
  resources :items
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
