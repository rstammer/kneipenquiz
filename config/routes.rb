Kneipenquiz::Application.routes.draw do
  root to: 'games#index'

  resources :games
  resources :questions
  resources :teams
end
