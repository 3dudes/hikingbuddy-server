Rails.application.routes.draw do
  namespace :api do
    resources :missions, only: :index
  end
end
