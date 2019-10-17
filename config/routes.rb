Rails.application.routes.draw do
  root 'homes#top'

  resources :microposts do
    resource :comments, only: [:create, :destroy]
    resources :topics, only: [:new, :create, :destroy]
  end

  get    '/login',                  to: 'sessions#new'
  post   '/login',                  to: 'sessions#create'
  get    'auth/:provider/callback', to: 'sessions#create'
  delete '/logout',                 to: 'sessions#destroy'

  resources :users do
    resource :profiles
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  get 'relationships/create'
  get 'relationships/destroy'

  post    '/favorites',  to: 'favorites#create'
  delete  '/favorites',  to: 'favorites#destroy'
end

