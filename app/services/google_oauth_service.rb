class GoogleOauthService
  require 'oauth2'

  def initialize()
    @host = Rails.env.production? ? "https://panda-contact.herokuapp.com" : "http://localhost:3000"
    @client = get_client
  end

  def get_client
    @client ||
      OAuth2::Client.new(ENV['GOOGLE_CLIENT_ID'],
                         ENV['GOOGLE_CLIENT_SECRET'],
                         site:         'https://www.googleapis.com',
                         authorize_url:'https://accounts.google.com/o/oauth2/auth',
                         token_url:    'https://accounts.google.com/o/oauth2/token')
  end

  def link_authorization
    @client.auth_code.authorize_url(redirect_uri: "#{@host}/callback",
                                    scope: "https://www.googleapis.com/auth/contacts.readonly")
  end

  def token(code)
    @client.auth_code.get_token(code, redirect_uri: "#{@host}/callback")
  end

  def contacts_list(token, page_token=nil)
    token_object = OAuth2::AccessToken.new(@client, token)

    answer = token_object.get('https://people.googleapis.com/v1/people/me/connections',
                              params: { "pageSize":  30,
                                        "sortOrder": "FIRST_NAME_ASCENDING",
                                        "personFields": "names,emailAddresses",
                                        "pageToken": page_token
                                       })
    if answer.status == 200
      JSON.parse(answer.body)
    end
  end


end
