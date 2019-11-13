class Light
  attr_reader :id,
              :status,
              :bri,
              :reachable,
              :color_light

  def initialize(id, state)
    @id = id
    @on = state['on']
    @bri = state['bri']
    @reachable = state['reachable']
    @color_light = set_color_light(state)
  end

  def color_light?
    @color_light
  end

  def set_color_light(state)
    if state['xy'] then return true end
    false
  end

  def set_color(xy)
    if @color_light
      modify({xy: xy})
    end
  end

  def set_brightness(amount)
    @bri = amount
    modify({"bri": amount})
  end

  def flash
    turn_off
    sleep 0.01
    turn_on
    set_brightness(254)
  end

  def modify(state)
    state[:transitiontime] = 0
    HTTParty.put("#{HueApiService.root_url}/lights/#{@id}/state", body: state.to_json)
  end

  def randomize_color
    state = {
             # ct: rand(153..500),
             xy: [rand(0.111..0.888), rand(0.111..0.888)]
            }
    modify(state)
  end

  def turn_off
    @on = false
    modify({"on":false})
  end

  def turn_on
    @on = true
    modify({"on":true})
  end
end
