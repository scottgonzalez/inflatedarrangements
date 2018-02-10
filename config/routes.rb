Rails.application.routes.draw do
  get '/' => 'home#index'

  get '/admin' => 'admin#index'

  get '/contact' => 'contact#index'
  post '/contact' => 'contact#create'

  resources :categories
  resources :customer_messages, only: [:index, :show]
  resources :photos
  resources :products
end
