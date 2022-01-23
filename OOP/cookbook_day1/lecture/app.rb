# Bootstrap
require_relative 'task_repository'
require_relative 'tasks_view'
require_relative 'tasks_controller'
require_relative 'router'

task_repository = TaskRepository.new
tasks_view = TasksView.new
tasks_controller = TasksController.new(task_repository, tasks_view)
router = Router.new(tasks_controller)
router.run
