class TaskRepository
  # attr_reader :tasks

  def initialize
    @tasks = [] # Array of *Task* instances
  end

  def all
    @tasks
  end

  def find(index)
    @tasks[index]
  end

  def add(task)
    @tasks << task
  end

  def remove_at(index)
    @tasks.delete_at(index)
  end
end
