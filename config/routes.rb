Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :repos, only: [:index] 
  end

end
