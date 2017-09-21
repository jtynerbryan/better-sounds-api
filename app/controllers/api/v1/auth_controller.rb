class Api::V1::AuthController < ApplicationController

  # skip_before_action :authorized, only: [:spotify_request]

  def spotify_request
    # User has clicked "login" button - assemble get request to Spotify to have
    # user authorize application
    query_params = {
      client_id: ENV['CLIENT_ID'],
      response_type: "code",
      redirect_uri: 'http://localhost:3001/success',
      scope: "user-library-read user-top-read user-read-recently-played playlist-read-private",
      show_dialog: true
    }
    url = "https://accounts.spotify.com/authorize/"
    # redirects user's browser to Spotify's authorization page, which details
    # scopes my app is requesting
    redirect_to "#{url}?#{query_params.to_query}"
  end

  def show
  # if application_controller#authorized is successful, return data for user
    # render json: current_user
    render json: {username: current_user.username,
                  spotify_url: current_user.spotify_url,
                  profile_img_url: current_user.profile_img_url}
  end
end
