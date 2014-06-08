Kneipenquiz::Application.routes.draw do
  devise_for :users
  root to: 'games#index'

  resources :games do
    get :load_game, on: :collection
  end

  resources :category_mappings
  resources :questions
  resources :teams
end
