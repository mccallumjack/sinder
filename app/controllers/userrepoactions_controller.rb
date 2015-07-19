class UserrepoactionsController < ApplicationController


  def create
    @repo = Repo.find_by(name: params[:repo_name])
    @user_repo_action = UserRepoAction.create(user_id: session[:user_id], repo_id: @repo.id , status: params[:status])
  end


end