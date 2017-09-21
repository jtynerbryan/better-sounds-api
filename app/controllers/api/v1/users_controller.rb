class Api::V1::UsersController < ApplicationController
  def show
    user = User.find(1)

    render json: {user: user}
  end

  def create
    # handle response from Spotify
    if params[:error]
      puts "Login Error", params

      # if login failed, redirect to front-end error message
      redirect_to "http://localhost:3001/failure"
    else
      # if login succeeded, assemble and send request to Spotify for access and refresh tokens
      body = {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: ENV['REDIRECT_URI'],
        client_id: ENV['CLIENT_ID'],
        client_secret: ENV['CLIENT_SECRET']
      }

      auth_response = RestClient.post('https://accounts.spotify.com/api/token', body)
      #convert response.body to JSON for assignment
      auth_params = JSON.parse(auth_response.body)
      #assemble and send request to Spotify for user profile information
      header = {
        Authorization: "Bearer #{auth_params["access_token"]}"
        }

      user_response = RestClient.get("https://api.spotify.com/v1/me", header)

      #convert response.body to JSON for assignment
      user_params = JSON.parse(user_response.body)

      #Create new user based on response, or find existing user in database
      user = User.find_or_create_by(username: user_params["id"],
                        spotify_url: user_params["external_urls"]["spotify"],
                        href: user_params["href"],
                        uri: user_params["uri"])
      user.update(access_token: auth_params["access_token"], refresh_token: auth_params["refresh_token"])

      user.refresh_access_token

      #redirect to React front-end
      redirect_to "http://localhost:3001/success"
    end


  end

end
