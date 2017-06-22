Rails.application.routes.draw do
  get '/' => 'home#index'

  resources :categories
  resources :photos
  resources :products
end
