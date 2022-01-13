
# puts "Write your age"
# age = gets.chomp.to_i

# puts age.class
# puts "Your age is #{age}"



# if age >= 18
#   puts "you can vote"
# elsif age == 18
#   puts "You can barely vote"
# else
#   puts "You can't vote, do your homework"
# end

hour = gets.chomp.to_i

if hour < 12
  puts "Good morning!"
elsif hour < 20
  puts "Good afternoon!"
elsif hour < 24
  puts "Good night!"
else
  puts "Lunch time!"
end


hour = Time.now.hour

if (9..12).include?(hour) || (hour > 14 && hour < 18)
  puts "The shop is opened!"
else
  puts "Sorry, the shop is closed..."
end
