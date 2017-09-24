Rails.application.routes.draw do
  get '/' => 'home#index'

  get '/contact' => 'contact#index'
  post '/contact' => 'contact#create'

  resources :categories
  resources :photos
  resources :products
end
