Rails.application.routes.draw do
  root "songs#index"

  resources :songs

  get "/api/:request", to: "songs_api#api"
end
