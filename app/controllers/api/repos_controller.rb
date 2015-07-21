module Api
  CLIENT_ID = ENV["GITHUB_KEY"]
  CLIENT_SECRET = ENV["GITHUB_SECRET"]
  require 'rest-client'

  class ReposController < ApplicationController

    def index
      user = User.find_by(github_access_token: session[:access_token])
      if params[:language] && params[:language] != "all languages"
        repos = Repo.language_repos(user, params[:language])
      else
        repos = Repo.all_repos(user)
      end
      render json: repos
    end

    def issues
      repo = Repo.find_by(id: params[:id])
      result = RestClient.get("https://api.github.com/repos/#{repo.full_name}/issues?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}")

      render json: result
    end

  end
end
