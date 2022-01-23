class Router
  def initialize(tasks_controller)
    @tasks_controller = tasks_controller
    @running = true
  end

  def run
    while @running
      # Ask user which action he wants to do (by index)
      print_menu
      # Get the user answer
      print '> '
      choice = gets.chomp.to_i
      # Route the user to the right action
      route_action(choice)
    end
  end

  private

  def print_menu
    puts ' WELCOME ON TODO LIST'
    puts 'What do you want to do next? (enter a number)'
    puts '1. List all tasks'
    puts '2. Create a new task'
    puts '3. Mark a task as done'
    puts '4. Delete a task'
    puts '5. Quit'
  end

  def route_action(choice)
    case choice
    when 1 then @tasks_controller.list
    when 2 then @tasks_controller.create
    when 3 then @tasks_controller.mark_a_task_as_done
    when 4 then @tasks_controller.destroy
    when 5 then stop!
    else
      puts 'Dummy... put a right number :)'
    end
  end

  def stop!
    @running = false
  end
end
