Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'chat', to: 'chat#index'
  post 'chat', to: 'chat#chat'

  # get 'chat/index'
  resources :questions, only: [:index, :create]
  resources :chatboxs, only: [:index, :create]
  resources :movies
  root :to => redirect('/movies')
end
