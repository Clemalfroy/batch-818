def tag(tag_name, content,  attributes)
  flat_attrs = attributes.map { |key, val| " #{key}='#{val}'" }.join
  p "<#{tag_name}#{flat_attrs}>#{content}</#{tag_name}>"
end

tag('a', "Trouver l'amour", {
  'href': 'http://tinder.com',
  'id': 'my-link'
})


'<a href="http://tinder.com"> Trouver l\'amour </a>'