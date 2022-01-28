require_relative 'view'
require_relative 'task'

class Controller
  def initialize
    @view = View.new
    
  end

  def list 
    tasks = Task.all
    @view.display(tasks)
  end

  def update
    list
    choice = @view.ask_for('update').to_i
    task = Task.find(choice)

    column = @view.ask_for_column
    new_value = @view.ask_for('new value')
    
    task.send(:"#{column}=", new_value)
    task.save
    
    
  end
end