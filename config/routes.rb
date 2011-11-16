Rails.application.routes.draw do
  namespace :admin do
    get 'features' => 'features#index'

    resources :roles
  end
end
