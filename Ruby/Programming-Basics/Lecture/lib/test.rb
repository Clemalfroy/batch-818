def display_date(year, month, day)
  p "It is a #{day} in the month: #{month} of year #{year}"
end


day = 'Monday'
month = 'February'
year = '2020'

display_date(year, month, day)

def tomorrow
  tomorrow_date = Date.today + 1
  return tomorrow_date.strftime("%B %d")
end

puts tomorrow