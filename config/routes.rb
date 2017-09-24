Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
      namespace :v1 do
        get '/login', :to => 'auth#spotify_request'
        post '/users/create', :to => 'users#create'
        get '/users/show', :to => 'users#show'
        post '/top_tracks', :to => 'tracks#top_tracks'
        post '/recently_played_tracks', :to => 'tracks#recently_played_tracks'
        post '/audio_features', :to => 'audio_features#audio_features'
      end
  end
end
