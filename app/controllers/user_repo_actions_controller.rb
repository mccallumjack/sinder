class UserRepoActionsController < ApplicationController
skip_before_action :verify_authenticity_token


  def star
    user_repo_action = UserRepoAction.star(session[:github_access_token], params[:repo_full_name])

    render :nothing => true
  end

  def hide
    repo = Repo.find_by(full_name: params[:repo_full_name])
    user = User.find_by(github_access_token: session[:github_access_token])
    user_repo_action = UserRepoAction.create(user_id: user.id, repo_id: repo.id, status: 0)

    render :nothing => true
  end


end