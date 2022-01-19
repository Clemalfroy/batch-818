require "pry-byebug"

# binding.pry

(1..10).each do |number|
  binding.pry
  puts number
end

a = "coucou"

# puts a

a.capitalize!

puts a
