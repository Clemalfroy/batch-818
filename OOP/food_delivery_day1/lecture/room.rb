class Room
  # capacity (Integer)
  # patients (Array)

  class OverCapacityError < StandardError; end

  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity]
    @patients = []
  end

  def full?
    @patients.length >= @capacity
  end

  def add(patient)
    raise OverCapacityError, 'Room is full' if full?

    patient.room = self
    @patients << patient
  end
end
