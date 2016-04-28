Rails.application.routes.draw do
  resources :shines
  resources :sessions, only:[:new, :create, :destroy]

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/shines/new',    to: 'shines#new',          via: 'get'

  resources :users
  resources :brightsides
  resources :shines

  root to: 'static_pages#home'

  match '/about', to: 'static_pages#about', via: 'get'

end
