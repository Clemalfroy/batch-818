class Citizen
  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def can_vote?
    @age >= 18
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end
end

mich = Citizen.new('Michel', 'de Bourgogne', 13)
puts mich.can_vote?
puts mich.full_name

# Implement a Citizen class with the following API:

#     #initialize(first_name, last_name, age)
#     #can_vote? (boolean)
#     #full_name (String)
