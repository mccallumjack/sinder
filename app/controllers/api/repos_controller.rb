module Api

  class ReposController < ApplicationController

    def index
      render json: Repo.all
    end

    def default_serializer_options
      { root: false }
    end

  end
end