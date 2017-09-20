Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
      namespace :v1 do
        get 'login', :to => 'auth#spotify_request'
        get '/user/create', :to => 'users#create'
        get '/user/show', :to => 'users#show'
      end
  end
end