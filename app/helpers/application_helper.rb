module ApplicationHelper

  CLIENT_ID = ENV["GITHUB_KEY"]
  CLIENT_SECRET = ENV["GITHUB_SECRET"]

  def authenticated?
    session[:access_token]
  end

  def authenticate!
    @client_id = CLIENT_ID
  end

end
