module HueApiService
  extend self
  def root_url
    "http://#{ENV['hue_bridge_ip']}/api/#{ENV["hue_username"]}"
  end

  def get_all_lights
    HTTParty.get("#{root_url}/lights").body
  end

  def all_lights_json
    JSON.parse(get_all_lights)
  end
end
