Rails.application.routes.draw do

  root :to => "homepage#index"

  namespace :api, defaults: {format: :json} do
    resources :repos, only: [:index]
  end

end
