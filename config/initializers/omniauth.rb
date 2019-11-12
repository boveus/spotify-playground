require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["spotify_client"], ENV["spotify_secret"], scope: 'user-read-currently-playing
  user-modify-playback-state user-read-playback-state playlist-modify-public
  user-library-read user-library-modify streaming'
end
