Rails.application.routes.draw do
  root "welcome#index"
  resources :words, only: [:create]
  get '/validation', to: 'validation#index'
end
