Rails.application.routes.draw do
  devise_for :users
  root to: 'static#root'
  namespace :admin do
    get '/', to: "admin#index"
    resources :applications
    resources :users
    resources :reviews, controller: :reviews
  end
  resources :conventions, only: [:index, :show] do
    resources :events, only: [:index, :show]
    resources :event_applications
  end
  resources :profiles, path: 'profile'
end
