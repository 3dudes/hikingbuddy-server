Rails.application.routes.draw do
  namespace :api do
    resources :missions, only: :show do
      get :search, on: :collection
    end
    resources :mission_sessions, only: :create
  end
end
