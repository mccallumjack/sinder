class GitHubAuthCallbacksController < ApplicationController
  def github
    user_from_github_access_token
    unless session[:access_token]
      flash[:error] = 'There was an error contacting GitHub.'
    end
    redirect_to root_path
  end

private

  def user_from_github_access_token
    User.where(github_token: github_access_token).first_or_initialize
  end

  def github_access_token
    client = Octokit::Client.new
    token_response = client.exchange_code_for_token code_params[:code]
    session[:access_token] = token_response['access_token']
  end

  def code_params
    params.permit(:code)
  end
end
