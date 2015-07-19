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
    token_response = client.exchange_code_for_token(session_code)
    session[:access_token] = token_response['access_token']

    # result = RestClient.post('https://github.com/login/oauth/access_token',
    #                       {:client_id => CLIENT_ID,
    #                        :client_secret => CLIENT_SECRET,
    #                        :code => session_code},
    #                        :accept => :json)
    # session[:access_token] = JSON.parse(result)['access_token']
    User.where(github_access_token: session[:access_token]).first_or_initialize
    redirect_to display_path
  end

end
