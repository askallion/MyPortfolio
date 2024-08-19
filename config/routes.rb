Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  devise_for :users
  root to: 'homes#top'

   resources :users
   resources :posts do
    collection do
      get 'index_red'
      get 'index_blue'
      get 'index_green'
      get 'index_mono'
    end
  end
  
  resources :posts do
    resource :like, only: [:create, :destroy]
  end
  
  resources :users do
    member do
      get :likes
    end
  end
end
