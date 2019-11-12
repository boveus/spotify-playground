class HueService
  def initialize
    @active_lights = []
    @color_lights = []
    refresh_lights
  end

  def refresh_lights
    HueApiService.all_lights_json.each do |json|
      light = light_from_json(json)
      add_to_lights(light)
    end
  end

  def add_to_lights(light)
    @active_lights << light
    if light.color_light?
      @color_lights << light
    end
  end

  def light_from_json(light)
    id = light.first
    state = light.last["state"]
    Light.new(id, state)
  end

  def all_color_lights_do(method)
    @color_lights.each { |light| light.send(method) }
  end

  def all_lights_do(method)
    @active_lights.each { |light| light.send(method) }
  end

  def set_brightness_all_lights(amount)
    @active_lights.each { |light| light.set_brightness(amount) }
  end
end
