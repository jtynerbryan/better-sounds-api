class Api::V1::TopArtistsController < ApplicationController

    def top_artists
      @user = User.find(params[:user_id])

      header = {
        Authorization: "Bearer #{@user.access_token}"
      }

      top_artists_response = RestClient.get("https://api.spotify.com/v1/me/top/artists?limit=10", header)
      top_artists_to_send = JSON.parse(top_artists_response.body)
      render json: { top_artists: top_artists_to_send }
    end
end
