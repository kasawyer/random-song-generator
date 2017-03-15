Rails.application.routes.draw do
  root "songs#index"

  namespace :api do
    namespace :v1 do
      resources :songs, only: [:index]
    end
  end
end
