class HomeController < ApplicationController

  def welcome
    google_oauth_service = GoogleOauthService.new
    @link_authorization = google_oauth_service.link_authorization
  end

  def callback
    google_oauth_service = GoogleOauthService.new
    @token = google_oauth_service.token(params[:code])

    cookies[:token] = @token.to_hash[:access_token]

    redirect_to contacts_list_path
  end

  def contacts_list

    google_oauth_service = GoogleOauthService.new
    @contacts = google_oauth_service.contacts_list(cookies[:token], params[:page_token])

  end

end
