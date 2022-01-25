require 'csv'

class PatientRepository
  def initialize(csv_file, room_repository)
    @csv_file = csv_file
    @room_repository = room_repository
    @patients = []
    @next_id = 1
    load_csv
  end

  def add_patient(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
  end

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, options) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == 'true'
      room = @room_repository.find(row[:room_id].to_i)
      patient = Patient.new(row)
      patient.room = room
      @patients << patient
    end
    @next_id = @patients.last.id + 1 unless @patients.empty?
  end
end
