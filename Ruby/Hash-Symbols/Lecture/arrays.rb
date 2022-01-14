students =     [ "Peter", "Mary", "George", "Emma" ]
student_ages = [ 24     , 25    , 22      ,  20,  25  ]

student_ages.each_with_index do |age, index|
  p students[index]
  p age
end