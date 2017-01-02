Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'netivot#index'

  resources :network
  resources :team
  resources :contact
  resources :resources
  resources :events
  resources :join

end
