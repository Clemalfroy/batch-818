require "nokogiri"

file      = File.open("data/beatles.xml")
document  = Nokogiri::XML(file)

document.root.xpath("beatle").each do |beatle|
  first_name = beatle.xpath("first_name").text
  last_name = beatle.xpath("last_name").text
  instrument = beatle.xpath("instrument").text

  puts "#{first_name} #{last_name} played #{instrument}"
end