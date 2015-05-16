Rails.application.routes.draw do
  namespace :api do
    resources :missions, only: :show do
      get :search, on: :collection
    end
  end
end
