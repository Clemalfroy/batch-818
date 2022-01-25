class Patient
  attr_reader :name
  attr_accessor :room, :id

  # State
  # name (String)
  # cured (Boolean TrueClass FalseClass)
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end

  # Behavior
  def cure!
    @cured = true
  end

  def cured?
    @cured
  end

  # def name
  #   @name
  # end
end
