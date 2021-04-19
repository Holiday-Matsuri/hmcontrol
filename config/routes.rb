Rails.application.routes.draw do
  root to: 'static#root'
  namespace :admin do
    resources :application_reviews, controller: :application_reviews
  end
  devise_for :users
  resources :conventions, only: [:index, :show] do
    resources :events, except: [:destroy]
    resources :event_applications
  end
end
