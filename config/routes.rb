Rails.application.routes.draw do

  root :to => "homepage#index"
  get '/display' => "homepage#display"
  get '/github' => "homepage#github"

  namespace :api, defaults: {format: :json} do
    resources :repos, only: [:index]
  end

end
