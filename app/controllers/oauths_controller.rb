class OauthsController < ApplicationController
  skip_before_filter :require_login
  before_filter :require_login, only: :destroy

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]

    if @user = login_form(provider)
      flash[:notice] = "Logged in using #{provider.titleize}!"
    else
      flash[:alert] = 'You are required to link your GitHub account before you can use this feature. You can do this by clicking "Link your Github account" after you sign in.'
      link_account(provider)
      redirect_to root_path
    end
  end

   def destroy
    provider = params[:provider]

    authentication = current_user.authentications.find_by_provider(provider)
    if authentication.present?
      authentication.destroy
      flash[:notice] = "You have successfully unlinked your #{provider.titleize} account."
    else
      flash[:alert] = "You do not currently have a linked #{provider.titleize} account."
    end

    redirect_to root_path
  end

  def link_account(provider)
    if @user = add_provider_to_user(provider)
      @user.update_attribute(:github_login, @user_hash[:user_info]['login'])
      flash[:notice] = "You have successfully linked your GitHub account."
    else
      flash[:alert] = "There was a problem linking your GitHub account."
    end
  end

  def auth_params
    params.permit(:code, :provider)
  end

end