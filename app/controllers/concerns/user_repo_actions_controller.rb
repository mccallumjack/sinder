class UserRepoController < ApplicationController

  def new
    @user = User.find_by(:id session[:id])
    @repo = Repo.find_by(:id session[:repo_id])
    @status =
    @user_repo_action = UserRepoAction.new(id: @user.id, repo_id: @repo.id, status: status  )
  end


end