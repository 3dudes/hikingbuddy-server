Rails.application.routes.draw do
  namespace :api, format: :json do
    resource :user, only: :show
    resource :user, only: :show
    resource :session, only: [:create, :destroy]
    resources :missions, only: [:show, :index] do
      get :search, on: :collection
      get :route, on: :member
      get :height_profile, on: :member
      get :ranking, on: :member
    end
    resource :mission_session, only: [:create, :destroy]
    resources :activities, only: :index
  end
end
