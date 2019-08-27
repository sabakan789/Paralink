Rails.application.routes.draw do
  root 'homes#top'

  resources :microposts do
    resources :topics
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'



  resources :users do
    resource :profiles

    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  get 'relationships/create'
  get 'relationships/destroy'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'

  get 'comments/:micropost_id/new', to: 'comments#new', as: 'comments'
  post 'comments/:micropost_id/create', to: 'comments#create', as:'comments_create'
  delete 'comments/:micropost_id/destroy', to: 'comments#destroy', as:'comments_destroy'
end
