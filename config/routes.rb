Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'netivot#index'

  resources :network
  resources :team
  resources :contact
  resources :resources
  resources :events, only: [:index]
  resources :join

  namespace :admin do
    root to: 'dashboards#index'

    resources :events, only: [:index, :new, :create, :edit, :update, :destroy]
  end

end
