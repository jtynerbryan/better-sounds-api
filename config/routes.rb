Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
      namespace :v1 do
        get '/login', :to => 'auth#spotify_request'
        post '/users/create', :to => 'users#create'
        get '/users/show', :to => 'users#show'
        get '/top_tracks', :to => 'tracks#top_tracks'
        get '/recently_played_tracks', :to => 'tracks#recently_played_tracks'
        get '/audio_features', :to => 'audio_features#audio_features'
        get '/related_artists', :to => 'related_artists#related_artists'
        get '/related_artists_top_tracks', :to => 'related_artists#top_tracks'
        get '/top_artists', :to => 'top_artists#top_artists'
        post '/create_playlist', :to => 'playlists#create'
        get '/get_playlists', :to => 'playlists#show'
      end
  end
end
