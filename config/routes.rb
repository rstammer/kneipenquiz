Kneipenquiz::Application.routes.draw do
  devise_for :users
  root to: 'public#start'

  get '/backend', to: 'games#index', as: :backend
  get '/reglement', to: 'public#reglement', as: :reglement

  resources :games do
    get :menu, on: :collection
  end

  get '/games/:game_id/slides/:slide_number', to: 'games#slides'

  resources :posts
  resources :category_mappings
  resources :questions
  resources :teams
  resources :results, except: [:index, :edit, :update] do
    get   :bulk_edit,        on: :collection
    patch :bulk_update, on: :collection
  end
end
