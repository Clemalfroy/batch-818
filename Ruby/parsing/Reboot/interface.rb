require_relative 'list.rb'
require_relative 'view.rb'
require_relative 'scraper.rb'

christmas_list = [
  {
    name: "Chaussures",
    is_bought: false
  },
  {
    name: "Babybel",
    is_bought: false
  }
]

user_action = nil
while user_action != 'quit'
  puts "Choose an action : [list, add, delete, quit, buy]"
  user_action = gets.chomp
  if user_action == "list"
    display_list(christmas_list)
  elsif user_action == "add"
    user_item = ask_user_for_input("What do you want to add to your list?")
    add_to_list(user_item, christmas_list)
  elsif user_action == "delete"
    user_item = ask_user_for_input("What do you want to remove to your list?")
    remove_from_list(user_item, christmas_list)
  elsif user_action == "buy"
    display_list(christmas_list)
    user_item = ask_user_for_input("What did you buy ?")
    buy_item_of_list(user_item, christmas_list)
  elsif user_action == "idea"
    user_idea = ask_user_for_input("What do you want to search ?")
    titles = get_etsy_titles_from_search(user_idea)
    index = ask_user_for_index_in(titles)
    add_to_list(titles[index], christmas_list)
  end
end
