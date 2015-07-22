class HomepageController < ApplicationController
  CLIENT_ID = ENV["GITHUB_KEY"]
  CLIENT_SECRET = ENV["GITHUB_SECRET"]

  require 'rest-client'

  def index
    @client_id = CLIENT_ID
  end

  def display
    render 'display'
  end

  def github
    result = RestClient.post('https://github.com/login/oauth/access_token',
                          {:client_id => CLIENT_ID,
                           :client_secret => CLIENT_SECRET,
                           :code => params[:code]},
                           :accept => :json)
    session[:access_token] = JSON.parse(result)['access_token']
    user = User.where(github_access_token: session[:access_token]).first_or_create
    user.check_interactions
    redirect_to display_path
  end

  def logout
    session[:access_token] = nil
    redirect_to root_path
  end

  def reset_interactions
    user = User.find_by(github_access_token: session[:access_token])
    user.destroy_interactions
    user.check_interactions
    redirect_to display_path
  end

  private
  def code_params
    params.permit(:code)
  end
end
