class HomepageController < ApplicationController

  CLIENT_ID = ENV["GITHUB_KEY"]
  CLIENT_SECRET = ENV["GITHUB_SECRET"]

  def index
    @client_id = CLIENT_ID
  end

  def display
    render 'display'
  end

end