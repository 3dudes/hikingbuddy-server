Rails.application.routes.draw do
  namespace :api do
    get '/missions/search', to: 'missions#search'
    resources :missions, only: :show
  end
end
