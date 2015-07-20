module Api

  class ReposController < ApplicationController

    def index
      repos = params[:language] && params[:language] != "all languages" ? Repo.where("language ilike '#{params[:language]}'") : Repo.all
      render json: repos
    end

  end
end