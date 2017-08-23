class HomeController < ApplicationController

  def welcome
    google_oauth_service = GoogleOauthService.new
    @link_authorization = google_oauth_service.link_authorization
  end

  def callback
    code = params[:code]

    google_oauth_service = GoogleOauthService.new
    @token = google_oauth_service.token(code)

    Rails.logger.debug "==== " + @token.to_hash.inspect

    render inline: "ok"
  end

end
