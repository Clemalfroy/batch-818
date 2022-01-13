def burger(patty, sauce, toppings)
  if block_given?
    transformed_patty = yield(patty)
    ['bread', transformed_patty, sauce, toppings, 'bread']
  else
    ['bread', patty, sauce, toppings, 'bread']
  end
end

# p burger('steak', 'mayo', 'salad')

result = burger('steak', 'mayo', 'salad') do |patty|
  "grilled #{patty}"
end


p result