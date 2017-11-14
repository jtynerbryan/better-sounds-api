# Better Sounds API
* Rails API for Better Sounds, an app that gives Users insight into their Spotify listening habits<br>
* Provides data and makes Spotify API calls for React front end ([repo](https://github.com/jtynerbryan/better-sounds))<br>
* View live site [here](https://bettersoundz.herokuapp.com) (please be patient while Heroku wakes up)
## Features
* Authorizes users through [Spotify's Web API Authorization](https://developer.spotify.com/web-api/authorization-guide/) to access a user's top tracks, recently played tracks, top artists, and playlists<br>
* When prompted by React front end app, makes specific requests for user data to Spotify's API and renders data to the front end
## Architecture
* See app folder for application code
* Utilizes the [Spotify Web API](https://developer.spotify.com/web-api/authorization-guide/) to authorize users and access private data
  * In order to use this repo, you must [register](https://developer.spotify.com/my-applications/#!/) your app with Spotify and store the client id, secret key, redirect uri, etc. as environment variables (I recommend the [Figaro](https://github.com/laserlemon/figaro) gem)
* [PostreSQL](https://www.postgresql.org/) database stores basic user info and library data 
