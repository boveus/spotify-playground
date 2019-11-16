module HueApiService
  extend self
  def root_url
    "http://#{ENV['hue_bridge_ip']}/api/#{ENV["hue_username"]}"
  end

  def get_all_lights
    HTTParty.get("#{root_url}/lights").body
  end

  def all_lights_modify(state)
    # state[:transitiontime] = 0
    HTTParty.put("#{root_url}/groups/2/action", body: state.to_json)
  end

  def all_lights_flash(tempo)
    # http://bradthemad.org/guitar/tempo_explanation.php
    beat = 240.0 / (tempo)
    Thread.new do
      30.times do
        all_lights_turn_off
        all_lights_turn_on
        all_lights_set_brightness(254)
      end
    end
  end

  def all_lights_set_brightness(amount)
    all_lights_modify({"bri": amount})
  end

  def all_lights_turn_off
    all_lights_modify({"on":false})
  end

  def all_lights_turn_on
    all_lights_modify({"on":true})
  end

  def all_lights_json
    JSON.parse(get_all_lights)
  end
end
