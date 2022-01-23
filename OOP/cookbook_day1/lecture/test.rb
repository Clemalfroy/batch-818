require_relative 'task'
require_relative 'task_repository'
require_relative 'tasks_view'
require_relative 'tasks_controller'

task_1 = Task.new('Faire des Class')
task_2 = Task.new('Faire mes flashcards')

# p task_1
# p task_2

task_2.mark_as_done!

# p task_2

repo = TaskRepository.new

# p repo

repo.add(task_1)
repo.add(task_2)

# p repo

view = TasksView.new
controller = TasksController.new(repo, view)

# controller.list
# controller.create
controller.mark_a_task_as_done
