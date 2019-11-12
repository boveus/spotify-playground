class HueController < ApplicationController
  def flash_lights
    HueService.new.all_lights_do(:flash)
    head :ok
  end
end
