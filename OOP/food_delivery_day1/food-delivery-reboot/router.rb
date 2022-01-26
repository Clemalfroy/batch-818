class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      print_menu
      choice = gets.chomp.to_i
      print `clear`
      route(choice)
    end
  end

  private

  def print_menu
    puts "What do you want to do?"
    puts '1. List all the meals'
    puts '2. Add a meal'
    puts '3. List all the customers'
    puts '4. Add a customer'
    puts '5. Quit'
  end

  def route(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then stop!
    else
      puts 'Wrong action... puts 1, 2, 3, 4 or 5'
    end
  end

  def stop!
    @running = false
  end
end
