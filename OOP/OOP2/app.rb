require_relative 'meerkat'
require_relative 'warthog'
require_relative 'lion'

# tom = Meerkat.new('tom')
# tom.talk

timon = Meerkat.new('timon')
pumbaa = Warthog.new('pumbaa')
simba = Lion.new('simba')
nala = Lion.new('nala')

animals = [timon, pumbaa, simba, nala]
animals.each {|animal| puts animal.talk; puts animal.sing }

p Lion.phylla
p Lion::PHYLLA

puts timon.eats('scorpion')
puts pumbaa.eats('snickers')
puts simba.eats('gazelle')
puts nala.eats
