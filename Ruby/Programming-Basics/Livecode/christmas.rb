
#Get then number of days between today and the next christmas


# Prochain noel ?
# Aujourd'hui ?

# Différence entre deux dates ?

#Conditions a checker:
#Annee bisextile ?
#Est-ce qu'on est après Noel mais avant le jour de l'an?
#Est-ce qu'on est le jour de Noel ? -> 0 + Joyeux Noel


#Validations

# Afficher ma date
# Avoir la valeur en jour
# Avoir un number comme valeur

require 'date'

def days_until_next_christmas(target_date=Date.today)
  christmas_date = Date.new(target_date.year, 12, 25)
  christmas_date = Date.new(target_date.year + 1, 12, 25) if christmas_date < target_date
  days = (christmas_date - target_date).to_i
  puts "Joyeux Noel" if days == 0
  days
end

# If after christmas and before new year
p days_until_next_christmas(Date.new(2022, 12, 26)) == 364
p days_until_next_christmas(Date.new(2022, 12, 24)) == 1
p days_until_next_christmas(Date.new(1999, 12, 26)) == 365
p days_until_next_christmas(Date.new(1999, 12, 25)) == 0