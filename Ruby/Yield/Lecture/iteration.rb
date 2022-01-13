musicians = ['toto', 'tutuuut', 'Nathaniel', 'Clement', 'Jeanro', 'Sam', 'Anna']

# for index in 0...(musicians.size)
#   puts "#{index + 1} - #{musicians[index]}"
# end

# for musician in musicians
#   puts musician
# end

# musicians.each do |musician|
#   puts musician
# end

# musicians.each_with_index do |musician, index|
#   puts "#{index + 1} - #{musician}"
# end

# smaller = musicians.min_by do |musician|
#   musician.length
# end

# musicians_upcased = []
# musicians.each do |musician|
#   musicians_upcased << musician.upcase
# end

# musicians_upcased = musicians.map do |musician|
#   if musician.starts_with?('t')
#     musician.upcase
#   else
#     musician.downcase
#   end
# end


# puts musicians.map(&:upcase)

# puts musicians_upcased

# myBool = musicians.any? do |musician|
#   musician.length > 5
# end

# puts myBool

long_name_musicians = musicians.reject do |musician|
  musician.length > 6
end

p musicians
p long_name_musicians

