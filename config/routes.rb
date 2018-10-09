Rails.application.routes.draw do
  resources :attendees
  resources :tags
  resources :comments
  resources :locations
  resources :users
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
