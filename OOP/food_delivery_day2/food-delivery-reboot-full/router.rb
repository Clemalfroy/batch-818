class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    while @running
      print_welcome
      @employee = @sessions_controller.sign_in
      while @employee
        @employee.manager? ? print_menu_for_manager : print_menu_for_rider
        choice = gets.chomp.to_i
        print `clear`
        @employee.manager? ? route_manager(choice) : route_rider(choice)
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
    puts '5. List all the undelivered orders'
    puts '6. Add an order'
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
    when 1 then @orders_controller.mark_as_delivered(@employee)
    when 2 then @orders_controller.list_my_orders(@employee)
    when 3 then sign_out!
    when 4 then stop!
    else
      puts 'Wrong action... puts 1, 2, 3 or 4'
    end
  end

  def route_manager(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    when 7 then sign_out!
    when 8 then stop!
    else
      puts 'Wrong action... puts 1, 2, 3, 4, 5, 6, 7 or 8'
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
