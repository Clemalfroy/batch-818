def display_list(list)
  p list
end

def add_to_list(item, list)
  list << {
    name: item,
    is_bought: false
  }
end

def list_includes?(item, list)
  list.any? { |element| element[:name] == item }
end

def remove_from_list(item, list)
  puts "Item not list" unless list_includes?(item, list)
  list.delete_if { |element| element[:name] == item }
end

def buy_item_of_list(item, list)
  if list_includes?(item, list)
    item_from_list = list.find { |element| element[:name] == item }
    item_from_list[:is_bought] = true
  else
    puts "Item not list"
  end
end