require_relative 'car'

# first car
my_car = Car.new('red')
puts my_car.engine_started?
my_car.start_engine
puts my_car.engine_started?
p my_car.color

puts
puts
# second car
other_car = Car.new('white')
p other_car.color
other_car.color = 'black'
p other_car.color
other_car.change_price(0)

puts
puts

p my_car
p other_car
p Car
