class Task
  attr_reader :name

  # State
  def initialize(name)
    @name = name
    @done = false
  end

  # Behavior
  def mark_as_done!
    @done = true
  end

  def done?
    @done
  end
end
