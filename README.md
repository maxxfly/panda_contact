# README

Description
===========

- use bootstrap for UI
- use oauth2 Gem : https://github.com/intridea/oauth2
- use GoogleOauthService for keep the controller light
- the token is save in a cookie
- get contacts list by https://people.googleapis.com/v1/people/me/connections API
- use https://developers.google.com/apis-explorer/?hl=en_US#p/people/v1/people.people.connections.list?resourceName=people%252Fme&pageSize=2&_h=4& to test the API and define the right parameters
- for the pagination, for previous link, I link a back link
