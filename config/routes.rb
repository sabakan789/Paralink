Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'

  root 'homes#top'
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :microposts

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'

  get 'comments/:micropost_id/new', to: 'comments#new', as: 'comments'
  post 'comments/:micropost_id/create', to: 'comments#create', as:'comments_create'

end
