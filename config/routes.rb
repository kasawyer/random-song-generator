Rails.application.routes.draw do
  root "tracks#index"
  resources :tracks, only: [:index]
end
