Rails.application.routes.draw do
  get 'search' => "searches#search"
  root to: "homes#top"
  devise_for :users
  
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update,]
  get 'homes/about', to: 'homes#about', as: 'about_homes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
