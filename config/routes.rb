Rails.application.routes.draw do
  devise_for :users
  root to: 'static#root'
  namespace :admin do
    get '/', to: "admin#index"
    get '/applications/category', to: 'applications#category'
    post '/applications/category/:id', to: 'applications#category_update'
    resources :applications do 
      resources :scheduling, only: [:new, :create]
    end
    resources :users
    resources :reviews, controller: :reviews
    resources :artists
    resources :guests
    resources :vendors
    resources :events
    resources :conventions do
      put 'activate', to: 'conventions#active'
    end
    
  end
  resources :conventions, only: [:index, :show] do
    resources :events, only: [:index, :show]
    resources :event_applications
  end
  namespace :api do
    resources :conventions, only: [:show] do
      get 'updated', to: 'conventions#convention_updated'
      resources :events, only: [:index]
      resources :vendors, only: [:index]
      resources :guests, only: [:index]
      resources :artists, only: [:index]
    end
  end
  resources :profiles, path: 'profile'
end
