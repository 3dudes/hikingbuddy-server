Rails.application.routes.draw do
  namespace :api do
    resources :locations, only: :index
  end
end
