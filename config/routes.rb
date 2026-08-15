Rails.application.routes.draw do
   namespace :admin do
    resource :session, only: [:new, :create, :destroy]
    resources :users, only: [:index, :show,:destroy] 
    resources :posts, only: [:destroy]

    root to: "users#index"
  end

scope module: :public do
  get "search/posts", to: "searches#posts"
  get "search/users", to: "searches#users"
  resources :users,path_names: { new: 'sign_up' } do
     resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :posts do 
    resource :favorite, only: [:create, :destroy,]
    resources :comments, only: [:create, :destroy]
  end

  get "favorites", to: "favorites#index"

  root to: "homes#top"
  resource :session
  post "guest_log_in", to: "sessions#guest"
  resources :passwords, param: :token

  get "log_in", to: "sessions#new"
  post "log_in", to: "sessions#create"
  delete "log_out", to: "sessions#destroy"

  
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
end
