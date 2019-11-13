class HueController < ApplicationController
  def flash_lights
    puts params
    HueApiService.all_lights_flash(params[:tempo])
    head :ok
  end
end
