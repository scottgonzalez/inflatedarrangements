Rails.application.routes.draw do
  get '/' => 'home#index'

  resources :photos
  resources :products
  resources :tags
end
