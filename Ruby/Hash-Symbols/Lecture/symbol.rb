# students_2 = {
#   "momo" => 24,
#   "jojo" => 23
# }
# p students_2.keys[0].class


students = {
  "momo": 24,
  "jojo": 23
}

# p students.keys[0].class

puts :jojo

user_input = gets.chomp
p user_input.to_sym.class
p user_input.to_sym
p students[user_input.to_sym]
p students['jojo']
