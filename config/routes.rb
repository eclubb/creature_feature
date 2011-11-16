Rails.application.routes.draw do
  namespace :admin do
    get 'features' => 'features#index'
  end
end
