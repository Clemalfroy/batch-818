def ask_user_for_input(message)
  puts message
  return gets.chomp
end

def ask_user_for_index_in(array)
  array.each_with_index do |value, index|
    puts "#{index} - #{value}"
  end
  gets.chomp.to_i
end