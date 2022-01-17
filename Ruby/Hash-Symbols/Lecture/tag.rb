def tag(tag_name, content,  attributes)
  flat_attrs = attributes.map { |key, val| " #{key}='#{val}'" }.join
  p "<#{tag_name}#{flat_attrs}>#{content}</#{tag_name}>"
end

tag('a', "Trouver l'amour", {
  'href': 'http://tinder.com',
  'id': 'my-link'
})


'<a href="http://tinder.com"> Trouver l\'amour </a>'


# TODO: Convert the array of arrays into an array of hashes.
students = [ [ "john", 28 ], [ "mary", 25 ], [ "paul", 21 ] ]
students.map do |student|
	{
    name: student[0],
    age: student[1]
  }
end

"coucou #{first_name.capitalize} #{last_name.capitalize}"



grades = [19, 8, 11, 15, 13]

sum = 0

grades.each do |grade|
  sum += grade
end

sum / grades.length
