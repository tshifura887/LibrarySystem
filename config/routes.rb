Rails.application.routes.draw do
  devise_for :users
  resources :patrons
  root 'books#index'
  resources :books do
    resources :authors
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/search', to: 'authors_books#search', as: 'search_books'
  get '/results', to: 'authors_books#results', as: 'search_results'

  get '/checkouts', to: 'checkouts#index', as: 'checkouts'
  get '/book_checkout', to: 'books#book_checkout', as: 'book_checkout'

  resources :checkouts

  get '/overdue_books', to: 'books#overdue_books', as: 'overdue_books'
end
