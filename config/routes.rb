Rails.application.routes.draw do
  devise_for :users
  resources :conventions, only: [:index, :show] do
    resources :events, except: [:destroy]
    resources :event_applications
  end
end
