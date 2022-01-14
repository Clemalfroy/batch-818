

# student = {
#   "age" => 25,
#   "name" => "Momo",
#   "score" => 20
# }

# p student["name"]

# student["name"] = 'jojo'



# array = ["momo", 'popo', 'jojo', 'lolo', ' nathaniel']

student_ages = {
  'momo' => {
    'score' => 20,
    'age' => 24
  },
  'jojo'=> {
    "age" => 23,
    "score" => 20
  },
  'nathaniel' => {
    "age" => 21,
    "score" => 0
  }
}

# p student_ages['momo']['age']

# student_ages.each do |key, value|
#   p "#{key} is #{value['age']}"
# end

students = {
  "momo" =>  [14, 16, 12],
  'jojo' => [11, 17, 12],
  'nathaniel' => [2, 6, 4]
}

student_names = students.keys

p student_names


# students.each do |student_name, marks|
#   is_good_student = marks.any? { |mark| mark > 15 }
#   p student_name if is_good_student
# end

paris = {
  "country" => "France",
  "population" => 2211000
}

paris["star_monument"] = "Tour Eiffel"

paris["restaurants"] = {
  "Macdo" => 3,
  "Quick" => 2,
  "Burger King" => 100
}

paris['restaurants']['So food'] = 0

paris.delete('restaurants')

# p paris

