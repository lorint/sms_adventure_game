Rails.application.routes.draw do
  resources :character_experiences
  resources :experience_removals
  root "characters#show"
  resources :experience_predecessors
  resources :experiences
  resources :locations
  resources :currencies
  resource :characters
  resources :character_bases
  resources :roles
  devise_for :users
end
