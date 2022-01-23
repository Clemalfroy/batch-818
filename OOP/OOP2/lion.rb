require_relative 'animal'

class Lion < Animal
  def talk
    return "#{@name} roars"
  end

  def eats(food = random_food)
    "#{super}. Law of the jungle!"
  end
end
