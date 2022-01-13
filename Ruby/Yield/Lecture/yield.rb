# require 'date'

# def timer
#   start_time = Time.now
#   yield
#   end_time = Time.now
#   yield
#   puts "Your code took #{end_time - start_time} s"
# end

# timer do
#   sleep 3
# end

# def map(my_array)
#   new_array = []
#   my_array.each do |element|
#     new_array << yield(element)
#   end
#   new_array
# end

# my_array = [1, 2, 3, 4]

# transformed_array = map(my_array) do |el|
#   el + 3
# end


# p transformed_array


# def adjectifier(noun, noun2)
#   yield(noun, noun2)
# end

# adjectified_noun = adjectifier('cat', 'dog') do |noun, noun2|
#   "Cool #{noun} #{noun2}"
# end

# p adjectified_noun

def burger
  puts "bread"
  yield
  puts "bread"
end

burger do
  puts "Chèvre"
  puts "Galette de pomme de terre"
  puts "Salade"
  puts "Tomate"
end
