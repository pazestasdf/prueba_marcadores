Rails.application.routes.draw do
  resources :bookmarks
  resources :varieties
  resources :categories

  get 'find_books/:category', to: 'bookmarks#find_books', as: 'find_books'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
