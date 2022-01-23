require_relative 'task'

class TasksController
  def initialize(task_repository, tasks_view)
    @task_repository = task_repository
    @tasks_view = tasks_view
  end

  def list
    display_tasks
  end

  def create
    # Ask user for the name of the task
    name = @tasks_view.ask_user_for_a_name
    # Create a Task instance with the name giving by user
    task = Task.new(name)
    # Store the task (repo)
    @task_repository.add(task)
    # optional: display the list of tasks to confirm it to user
    display_tasks
  end

  def mark_a_task_as_done
    # Display the tasks
    display_tasks
    # Ask user the task he wants to mark
    task_index = @tasks_view.ask_user_for_a_task_index('mark as done')
    # Retrieve the task from the repo
    task = @task_repository.find(task_index)
    # Mark the task as done
    task.mark_as_done!
    # Display the tasks
    display_tasks
  end

  def destroy
    # Display the tasks
    display_tasks
    # Ask user the task he wants to delete
    task_index = @tasks_view.ask_user_for_a_task_index('delete')
    # Remove the task from the repo
    @task_repository.remove_at(task_index)
    # Display the tasks
    display_tasks
  end

  private

  def display_tasks
    # Retrieve all the tasks
    tasks = @task_repository.all
    # Display the tasks
    @tasks_view.display(tasks)
  end
end
