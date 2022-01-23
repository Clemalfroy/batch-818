class TasksView
  def display(tasks)
    puts 'Here are all your tasks:'
    puts '-------------------------------------'
    tasks.each_with_index do |task, index|
      status = task.done? ? '[❎]' : '[ ]'
      puts "#{index + 1} - #{status} #{task.name}"
    end
    puts '-------------------------------------'
  end

  def ask_user_for_a_name
    puts 'What do you want to add as a task?'
    gets.chomp.strip
  end

  def ask_user_for_a_task_index(action)
    puts "What's the task's index you want to #{action}?"
    gets.chomp.to_i - 1
  end
end
