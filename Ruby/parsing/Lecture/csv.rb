require "csv"

# filepath = "./beatles.csv"

# CSV.foreach(filepath, headers: :first_row) do |row|
#   # Here, row is an array of columns
#   puts "#{row["First Name"]} | #{row["Last Name"]} | #{row["Instrument"]}"
# end

filepath = './beatles_remastered.csv'

CSV.open(filepath, "wb") do |csv|
  csv << ["First Name", "Last Name", "Instrument"]
  csv << ["John", "Lennon", "Guitar"]
  csv << ["Paul", "McCartney", "Bass Guitar"]
end