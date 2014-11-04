Kneipenquiz::Application.routes.draw do
  devise_for :users
  root to: 'news#index'

  get '/backend', to: 'games#index', as: :backend

  resources :games do
    get :menu, on: :collection
  end

  resources :news
  resources :category_mappings
  resources :questions
  resources :teams
end
