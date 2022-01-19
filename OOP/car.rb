# How to create a car
class Car
  def initialize(color)
    @engine_started = false
    @color = color
    @price = 1000
  end

  attr_accessor :color

  attr_reader :price
  # def color
  #   return @color
  # end

  def engine_started?
    return @engine_started
  end

  def start_engine
    @engine_started = true
  end

  def stop_engine
    @engine_started = false
  end

  def start_stop
    @engine_started = !@engine_started
  end

  def change_price_if_authorized(new_price)
    change_price(new_price) if authorized?
  end

  # attr_writer :color
  # def color=(new_color)
  #   @color = new_color
  # end

  private

  def authorized?
    #...
  end

  def change_price(new_price)
    @price = new_price
  end
end
