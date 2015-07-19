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
    session_code = params[:code]
    result = RestClient.post('https://github.com/login/oauth/access_token',
                          {:client_id => CLIENT_ID,
                           :client_secret => CLIENT_SECRET,
                           :code => session_code},
                           :accept => :json)
    session[:access_token] = JSON.parse(result)['access_token']
    redirect_to display_path
  end

end
