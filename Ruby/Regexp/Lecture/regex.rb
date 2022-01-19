pattern = /^(?<first_namee>\w+) (?<last_namee>\w+)$/

match_data = "jean Doe".match(pattern)

puts match_data.class
if match_data
  puts "All: #{match_data[0]}"
  puts "Firstname: #{match_data[:first_namee]}"
  puts "Lastname: #{match_data[:last_namee]}"
end


p "hello guys".gsub(/[aeiou]/i, '~')

students = [ [ "john", 28 ], [ "mary", 25 ], [ "paul", 21 ] ]

# TODO: Convert the array of arrays into an array of hashes.

students.map |student|
  {
    name: student[0],
    age: student[1]
  }
end