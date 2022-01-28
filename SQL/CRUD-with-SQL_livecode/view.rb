class View
  def ask_for(stuff)
    puts "what do you want to #{stuff}"
    gets.chomp
  end

  def display(tasks)
    tasks.each do |task|
      p task
      puts "#{task.id} - #{task.title}"
    end
  end

  def ask_for_column
    puts "1- title, 2- description, 3- done"
    choice = gets.chomp.to_i
    case choice
    when 1 then 'title'
    when 2 then 'description'
    when 3 then 'done'
    end

  end

end