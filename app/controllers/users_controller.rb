class UsersController < ApplicationController
  def spotify
    @user = RSpotify::User.new(request.env['omniauth.auth'])
    @player = @user.player
    @song = @player.currently_playing
    @audio_features = @song.audio_features
  end
end
