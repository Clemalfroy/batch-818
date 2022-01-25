require_relative 'patient'
require_relative 'patient_repository'
require_relative 'room'
require_relative 'room_repository'

john = Patient.new(name: 'Clément')
paul = Patient.new(name: 'Jean-ro')

# p john.name
# p john.cured?

# room_1 = Room.new(capacity: 2)
# p room_1

# room_1.add(john)
# room_1.add(paul)
# p room_1.full?
# p paul.room

# begin
#   georges = Patient.new(name: 'Georges')
#   room_1.add(georges)
# rescue Room::OverCapacityError => e
#   puts e.message
#   puts "Send him home :)"
# end

# p room_1
# puts 'Life goes on!'

rooms_csv = File.join(__dir__, 'rooms.csv')
rooms_repo = RoomRepository.new(rooms_csv)
# p rooms_repo

patients_csv = File.join(__dir__, 'patients.csv')
patients_repo = PatientRepository.new(patients_csv, rooms_repo)
patients_repo.add_patient(john)
# p patient_repo
patients_repo.add_patient(paul)
p patients_repo
p paul.room
