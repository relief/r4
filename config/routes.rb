SampleApp::Application.routes.draw do
  root to: 'static_pages#home'
  
  resources :users do
    member do
      get :following, :followers
      get :profile
    end
  end

  resources :sessions,      only: [:new, :create, :destroy]
  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
 
  match '/renren/login', to: 'renren#login',    via: 'get'
  match '/renren/logout', to: 'renren#logout',  via: 'get' 
  match '/renren/loginnext', to: 'renren#loginnext', via: [:get, :post]
  match '/renren/info',  to: 'renren#info',     via: 'get'
  match '/renren/basic_info', to: 'renren#basic_info', via: :get
  match '/renren/profile', to: 'renren#profile', via: :get
  match '/renren/feed', to: 'renren#feed', via: :get
  match '/renren/friend_list', to: 'renren#friend_list', via: :get
end
