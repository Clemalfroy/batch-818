class Building
  attr_reader :name, :width, :length

  def initialize(name, width, length)
    @name = name
    @width = width
    @length = length
  end

  def floor_area
    @width * @length
  end
end

class House < Building
  attr_reader :butler

  def initialize(name, width, length)
    @name = name
    @butler = Butler.new(self) # We need to pass the current instance of House
  end

  def self.price_per_square_meter(city)
    case city
    when "Paris" then 9000
    when "Brussels" then 3000
    else raise Exception.new("No data for #{city}")
    end
  end
end

class Skyscraper < Building
end

class Castle < Building
  attr_accessor :butler

  def self.categories
    ['Medieval', 'Norman', 'Ancient']
  end

  def has_a_butler?
    @butler != nil
  end

  def floor_area
    # @length * @ width + 300
    super + 300
  end
end

house_de_la_daronne = House.new("Maison de maman", 8, 5)
castle = Castle.new("Chateau de la princesse de Disneyland", 50, 40)

# puts house.floor_area
# puts castle.floor_area
# puts castle.name

castle.butler = 'George'
# puts castle.has_a_butler?

# puts house.has_a_butler?

# p Castle.categories


# p House.price_per_square_meter('Paris')
# p House.price_per_square_meter('London')

# puts 'toto'


# House.price_per_square_meter()


class Butler
  def initialize(house)
    @house = house # We want @house to store an instance of House
  end

  def clean_house
    puts "#{@house.name} cleaned!"
  end
end

alfred = Butler.new(house_de_la_daronne)
alfred.clean_house

p house_de_la_daronne.butler
