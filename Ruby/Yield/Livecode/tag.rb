def tag(tag_name, attributes=nil)
  if block_given? && !attributes.nil?
    "<#{tag_name} #{attributes[0]}=\"#{attributes[1]}\"> #{yield} </#{tag_name}>"
  elsif block_given?
  "<#{tag_name}> #{yield} </#{tag_name}>"
  else
    "<#{tag_name}></#{tag_name}>"
  end
end

p tag('h1') == '<h1></h1>'
p tag('h2') == '<h2></h2>'
p tag('a') == '<a></a>'


result = tag('a') do
  'my content'
end

p result == '<a> my content </a>'

result = tag('a', ['src', 'google.com']) do
  'my content'
end

p result == '<a src="google.com"> my content </a>'

result = tag('body') do
  tag('div') do
    tag('a', ['href', 'https://www.tinder.com']) do
        "trouve l'amour"
    end
  end
end

puts result
