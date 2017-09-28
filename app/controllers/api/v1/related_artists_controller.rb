class Api::V1::RelatedArtistsController < ApplicationController

  def related_artists
    @user = User.find(params[:user_id])
    header = {
        Authorization: "Bearer #{@user.access_token}"
    }

    related_artists_response = RestClient.get("https://api.spotify.com/v1/artists/" + params[:artist_id] + "/related-artists", header)

    related_artists_to_send = JSON.parse(related_artists_response.body)
    render json: {related_artists: related_artists_to_send}
  end

  def top_tracks
    @user = User.find(params[:user_id])
    header = {
        Authorization: "Bearer #{@user.access_token}"
    }

    artists_top_tracks_response = RestClient.get("https://api.spotify.com/v1/artists/" + params[:artist_id] + "/top-tracks?country=US", header)
    artists_top_tracks_to_send = JSON.parse(artists_top_tracks_response.body)
    render json: {top_tracks: artists_top_tracks_to_send}
  end



end
