Rails.application.routes.draw do
  resources :characters, only: :show
end
