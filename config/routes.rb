Rails.application.routes.draw do
  root "mixes#index"
  resources :mixes, only: %i(index show new create edit update destroy)
end
