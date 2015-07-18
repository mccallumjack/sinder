class ReposController < ApplicationController

  respond_to :json

  def index
    rend :json Repo.all
  end


  def default_serializer_options
    { root: false }
  end


end