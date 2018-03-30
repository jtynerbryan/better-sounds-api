class Api::V1::TracksController < ApplicationController

    def top_tracks
      @user  = User.find(params[:id])

      header = {
        Authorization: "Bearer #{@user.access_token}"
      }

      tracks_response = RestClient.get("https://api.spotify.com/v1/me/top/tracks?limit=50", header)
      tracks_to_send = JSON.parse(tracks_response.body)
      render json: {tracks: tracks_to_send}
    end

    def recently_played_tracks
      @user = User.find(params[:id])

      header = {
        Authorization: "Bearer #{@user.access_token}"
      }

      tracks_response = RestClient.get("https://api.spotify.com/v1/me/player/recently-played?limit=50", header)
      tracks_to_send = JSON.parse(tracks_response.body)
      render json: {tracks: tracks_to_send}
    end

end
