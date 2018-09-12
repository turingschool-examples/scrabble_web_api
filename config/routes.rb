Rails.application.routes.draw do
  root "welcome#index"
  resources :words, only: [:create]
  get '/validation', to: 'validation#index'

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show]
    end
  end
end
