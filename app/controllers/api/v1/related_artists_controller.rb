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

  end



end
