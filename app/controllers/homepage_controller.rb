class HomepageController < ApplicationController
  include ApplicationHelper

  use Rack::Session::Pool, :cookie_only => false

  def index
      # if !authenticated?
      #   authenticate!
      # else
      #   access_token = session[:access_token]
      #   scopes = []

      #   begin
      #     auth_result = RestClient.get('https://api.github.com/user',
      #                                  {:params => {:access_token => access_token},
      #                                   :accept => :json})
      #   rescue => e
      #     # request didn't succeed because the token was revoked so we
      #     # invalidate the token stored in the session and render the
      #     # index page so that the user can start the OAuth flow again

      #   session[:access_token] = nil
      #     return authenticate!
      # end

      # the request succeeded, so we check the list of current scopes
      # if auth_result.headers.include? :x_oauth_scopes
      #   scopes = auth_result.headers[:x_oauth_scopes].split(', ')
      # end

      # auth_result = JSON.parse(auth_result)

      # if scopes.include? 'user:email'
      #   auth_result['private_emails'] =
      #     JSON.parse(RestClient.get('https://api.github.com/user/emails',
      #                    {:params => {:access_token => access_token},
      #                     :accept => :json}))
      # end

      # erb :advanced, :locals => auth_result
    # end
  end

  def display
    render 'display'
  end

  def github
    session_code = request.env['rack.request.query_hash']['code']
    result = RestClient.post('https://github.com/login/oauth/access_token',
                          {:client_id => CLIENT_ID,
                           :client_secret => CLIENT_SECRET,
                           :code => session_code},
                           :accept => :json)
    session[:access_token] = JSON.parse(result)['access_token']
    redirect_to display_path
  end

end