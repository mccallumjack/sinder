module Api
  CLIENT_ID = ENV["GITHUB_KEY"]
  CLIENT_SECRET = ENV["GITHUB_SECRET"]
  require 'rest-client'


  class ReposController < ApplicationController

    def index
      user = User.find_by(github_access_token: session[:access_token])
      if params[:language] && params[:language] != "all languages" 
        repos = user ? Repo.language_repos(user, params[:language]) : Repo.where("language ilike '#{params[:language]}'")
      else 
        repos = user ? Repo.all_repos(user) : Repo.all
      end
      render json: repos
    end

    def issues
      repo = Repo.find_by(id: params[:id])
      result = RestClient.get("https://api.github.com/repos/#{repo.full_name}/issues?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}")
      result = JSON.parse(result).select{|issue| issue["state"] === "open"}[0..2]
      render json: result
    end

  end
end