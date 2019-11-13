module HueApiService
  extend self
  def root_url
    "http://#{ENV['hue_bridge_ip']}/api/#{ENV["hue_username"]}"
  end

  def get_all_lights
    HTTParty.get("#{root_url}/lights").body
  end

  def all_lights_modify(state)
    state[:transitiontime] = 0
    HTTParty.put("#{HueApiService.root_url}/groups/2/action", body: state.to_json)
  end

  def all_lights_flash(tempo)
    beat = 6.0 / (tempo)
    20.times do
      all_lights_turn_off
      sleep beat
      all_lights_turn_on
      all_lights_set_brightness(254)
      # sleep 0.5
    end
  end

  def all_lights_set_brightness(amount)
    @bri = amount
    all_lights_modify({"bri": amount})
  end

  def all_lights_turn_off
    @on = false
    all_lights_modify({"on":false})
  end

  def all_lights_turn_on
    @on = true
    all_lights_modify({"on":true})
  end

  def all_lights_json
    JSON.parse(get_all_lights)
  end
end
