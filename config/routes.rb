Rails.application.routes.draw do


  post '/star', to: "user_repo_actions#star"
  post '/hide', to: "user_repo_actions#hide"

  root :to => "homepage#index"
  get '/display' => "homepage#display"
  get '/github' => "homepage#github"

  get '/api/repos/:full_name/issues' => "api/repos#issues", defaults: { format: :json }
  
  namespace :api, defaults: {format: :json} do
    resources :repos, only: [:index]
  end

end
