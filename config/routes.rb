Rails.application.routes.draw do
  devise_for :users
  resources :conventions, only: [:index, :show] do
    resources :events, except: [:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
