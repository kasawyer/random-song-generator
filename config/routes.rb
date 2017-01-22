Rails.application.routes.draw do
  root "tracks#index"
  resources :tracks, only: [:index]
  get '/tracks/:id/winner', to: "tracks#winner"
end
