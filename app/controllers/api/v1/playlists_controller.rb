class Api::V1::PlaylistsController < ApplicationController

  def show
    user = User.find(params[:user_id])
    playlists = user.playlists
    render json: {playlists: playlists}
  end

  def create
    @user = User.find(params[:user_id])

    header = {
      "Authorization" => "Bearer #{@user.access_token}",
      "Content-Type" => "application/json"
    }

    body = {
      name: params[:playlist_name]
    }
      #create and return new epmty playlist
      api_url = "https://api.spotify.com/v1/users/#{@user.username}/playlists"
      api_response = RestClient.post(api_url, body.to_json, header)
      new_playlist = JSON.parse(api_response.body)

      #create new playlist in rails database
      playlist = Playlist.create(spotify_id: new_playlist["id"], user_id: @user.id)

      #split track uris to send to Spotify api
      track_body = {
        uris: params[:track_ids].split(',')
      }

      # add tracks to new empty playlist
      tracks_api_url = "https://api.spotify.com/v1/users/#{@user.username}/playlists/#{new_playlist["id"]}/tracks"
      tracks_api_response = RestClient.post(tracks_api_url, track_body.to_json, header)
      parsed_tracks_api_response = JSON.parse(tracks_api_response.body)

      #return new playlist to frontend
      render json: {playlist: playlist}
  end

end
