Rails.application.routes.draw do
  resources :character_experiences
  resources :experience_removals
  root "characters#show"
  resources :experiences do
    resources :experience_predecessors, shallow: true
  end
  resources :locations
  resources :currencies
  resource :characters
  resources :character_bases
  resources :roles
  devise_for :users
end
