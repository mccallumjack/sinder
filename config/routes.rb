Rails.application.routes.draw do

  resources :userrepoactions, only: [:create]

  root :to => "homepage#index"
  get '/display' => "homepage#display"


  namespace :api, defaults: {format: :json} do
    resources :repos, only: [:index]

  end

end
