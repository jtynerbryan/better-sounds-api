class Api::V1::AudioFeaturesController < ApplicationController
  def audio_features
    @user = User.find(params[:id])

    header = {
        Authorization: "Bearer #{@user.access_token}"
    }

    audio_features_response = RestClient.get(`https://api.spotify.com/v1/audio_features/ids=#{params[:ids]}`, header)
    audio_features_to_send = JSON.parse(tracks_response.body)
    render json: {tracks: audio_features_to_send}
  end
end
