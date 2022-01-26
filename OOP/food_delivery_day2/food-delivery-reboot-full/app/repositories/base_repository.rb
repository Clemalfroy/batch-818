require "csv"

class BaseRepository
  def initialize(file_csv)
    @file_csv = file_csv
    @elements = []
    @next_id = 1
    load if File.exist?(@file_csv)
  end

  def all
    @elements
  end

  def create(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    push
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  private

  def load
    CSV.foreach(@file_csv, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @elements << row_to_element(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

  def push
    CSV.open(@file_csv, "wb") do |csv|
      csv << headers
      @elements.each do |element|
        csv << element_to_row(element)
      end
    end
  end
end
