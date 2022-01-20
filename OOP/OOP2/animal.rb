class Animal
  class NotImplementedError < StandardError; end
  attr_reader :name

  PHYLLA = %w[Ecdysozoa Lophotrochozoa Deuterostomia]
  SONGS = ['Hakuna matata', 'Djadja', 'La Marseillaise', "C'est moi simba le roi"]

  def self.phylla
    %w[Ecdysozoa Lophotrochozoa Deuterostomia]
  end

  def initialize(name)
    @name = name
  end

  def talk
    raise NotImplementedError, "Please implement this in subclasses"
  end

  def sing
    "#{SONGS.sample}, nanananana"
  end

  def eats(food = random_food)
    "#{@name.capitalize} eats a #{food}"
  end

  def random_food
    self.class.phylla.sample
  end
end
