Rails.application.routes.draw do
  get 'investments/index'
  get 'investments/show'
  get 'investments/new'
  get 'investments/edit'
  get 'investments/destroy'
  devise_for :users
  
  # Default route for authenticate or unauthenticate user
  devise_scope :user do
    authenticated :user do
      root :to => 'groups#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'splash#index', as: :unauthenticated_root
    end
  end
  
  root 'splash#index'
  
  resources :groups do
    resources :investments
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
