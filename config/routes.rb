Rails.application.routes.draw do
  namespace :api, format: :json do
    resource :user, only: :show
    resources :missions, only: :show do
      get :search, on: :collection
    end
    resource :mission_session, only: [:create, :destroy]
  end
end
