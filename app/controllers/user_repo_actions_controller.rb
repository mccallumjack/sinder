class UserRepoActionsController < ApplicationController
skip_before_action :verify_authenticity_token


  def star
    if session[:access_token]
      user_repo_action = UserRepoAction.star(session[:github_access_token], params[:repo_full_name])
    end

    render :nothing => true

  end

  def hide
    if session[:access_token]
      repo = Repo.find_by(full_name: params[:repo_full_name])
      user = User.find_by(github_access_token: session[:github_access_token])
      user_repo_action = UserRepoAction.create(user_id: user.id, repo_id: repo.id, status: 0)
    end
    
    render :nothing => true
  end


end