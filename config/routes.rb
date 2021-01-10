Rails.application.routes.draw do
  root 'home#top'
  get 'home/about', to: 'home#about'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :index]
  resources :books
end
