class UsersController < ApplicationController
  def spotify
    @omniauth_auth = request.env['omniauth.auth']
    @user = RSpotify::User.new(@omniauth_auth)
    @player = @user.player
    @song = @player.currently_playing
    @audio_features = @song.audio_features
  end

  def refresh_song
    user = RSpotify::User.new(omniauth_params)
    player = user.player
    song = player.currently_playing
    audio_features = song.audio_features
    render json: {'song': song,
                  'audio_features': audio_features }
  end

  private

  def omniauth_params
    params[:omniauth_auth].permit!
  end
end
