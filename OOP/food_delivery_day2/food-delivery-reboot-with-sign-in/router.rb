class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      @employee = @sessions_controller.sign_in
      while @employee
        print_welcome
        if @employee.manager?
          print_menu_for_manager
          choice = gets.chomp.to_i
          print `clear`
          route_manager(choice)
        else
          print_menu_for_rider
          choice = gets.chomp.to_i
          print `clear`
          route_rider(choice)
        end
      end
    end
  end

  private

  def print_welcome
    puts '----------------------------'
    puts '  WELCOME ON FOOD DELIVERY  '
    puts '----------------------------'
  end

  def print_menu_for_manager
    puts '----------------------------'
    puts '        MANAGER MENU        '
    puts '----------------------------'
    puts "What do you want to do?"
    puts '1. List all the meals'
    puts '2. Add a meal'
    puts '3. List all the customers'
    puts '4. Add a customer'
    puts '5. Add an order'
    puts '6. List all the undelivered orders'
    puts '7. Sign out'
    puts '8. Quit'
  end

  def print_menu_for_rider
    puts '----------------------------'
    puts '        RIDER MENU        '
    puts '----------------------------'
    puts "What do you want to do?"
    puts '1. Mark one of my orders as delivered'
    puts '2. List all my undelivered orders'
    puts '3. Sign out'
    puts '4. Quit'
  end

  def route_rider(action)
    case action
    when 1 then puts 'TODO Mark one of my orders as delivered'
    when 2 then puts 'TODO List all my undelivered orders'
    when 3 then sign_out!
    when 4 then stop!
    else
      puts 'Wrong action... puts 1, 2 or 3'
    end
  end

  def route_manager(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then puts 'TODO Add an order'
    when 6 then puts 'TODO List all the undelivered orders'
    when 7 then sign_out!
    when 8 then stop!
    else
      puts 'Wrong action... puts 1, 2, 3, 4, 5, 6 or 7'
    end
  end

  def stop!
    sign_out!
    @running = false
  end

  def sign_out!
    @employee = nil
  end
end
