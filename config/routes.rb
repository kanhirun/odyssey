Rails.application.routes.draw do
  namespace :api do
    resources :library_users, only: :create
    post '/library_users/:id/book_request', to: 'library_users#book_request'
  end
end
