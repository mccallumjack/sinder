class ReposController < ApplicationController

  def index
    @repos = Repo.all
    render @repos
  end


end