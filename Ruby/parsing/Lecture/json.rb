require "json"

filepath = './beatles.json'

string_beatles = File.read(filepath)

# beatles = JSON.parse(string_beatles)

filepath = './students.json'

my_hash = {
  students: [
    {
      name: 'momo',
      grade: 15
    },
    {
      name: 'jojo',
      grade: 15
    },
  ]
}

File.open(filepath, "wb") do |file|
  file.write(JSON.generate(my_hash))
end
