Kneipenquiz::Application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  get '/backend', to: 'games#index', as: :backend

  resources :games do
    get :menu, on: :collection
  end

  resources :posts
  resources :category_mappings
  resources :questions
  resources :teams
end
