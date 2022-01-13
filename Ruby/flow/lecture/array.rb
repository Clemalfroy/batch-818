students = []



#['Gael', 'Toto']
#   0        1

# p students[students.find_index('Gael')]
# p students[0]


#Add value to array
students << 'Gael'
students << 'Gael'
students << 'Toto'
students << 'Gael'

students.each do |x|
   puts x
end

students.each { |x| puts x }