class RoomRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    @next_id = 1
    load_csv
  end

  def find(id)
    @rooms.find { |room| room.id == id }
  end

  private

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, options) do |row|
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      @rooms << Room.new(row)
    end
    @next_id = @rooms.last.id + 1 unless @rooms.empty?
  end
end
