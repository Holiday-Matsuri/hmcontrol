Rails.application.routes.draw do
  devise_for :users
  root to: 'static#root'
  namespace :admin do
    resources :users
    resources :application_reviews, controller: :application_reviews
  end
  resources :conventions, only: [:index, :show] do
    resources :events, only: [:index, :show]
    resources :event_applications
  end
  resources :profiles, path: 'profile'
end
