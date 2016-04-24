Rails.application.routes.draw do
  devise_for :library_users, controllers: { registrations: 'registrations' }

  root to: 'book_request#new'

  resources :library_users, only: :create

  post '/book_request', to: 'book_request#book_request'

  namespace :api do
    resources :library_users, only: :create
    post '/library_users/:id/book_request', to: 'library_users#book_request'
  end
end
