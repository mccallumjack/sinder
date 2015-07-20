class UserRepoActionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def star
    if session[:access_token] && Repo.find_by(full_name: params[:repo_full_name])
      user_repo_action = UserRepoAction.star(session[:access_token], params[:repo_full_name])
    end

    head 201
  end

  def hide
    if session[:access_token] && Repo.find_by(full_name: params[:repo_full_name])
      repo = Repo.find_by(full_name: params[:repo_full_name])
      user = User.find_by(github_access_token: session[:access_token])
      user_repo_action = UserRepoAction.create(user_id: user.id, repo_id: repo.id, status: 0)
    end

    head 201
  end
end
