Rails.application.routes.draw do

  root :to => "homepage#index"

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  delete "oauth/:provider" => "oauths#destroy", :as => :delete_oauth

  namespace :api, defaults: {format: :json} do
    resources :repos, only: [:index]
  end

end
