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
    User.where(github_access_token: session[:access_token]).first_or_create
    redirect_to display_path
  end

  private
  def code_params
    params.permit(:code)
  end
end
