#Write a method that returns the acronyme of a sentence

#Parameters:
#- Sentence

#Handle words like "of"

#Resolution:
 #Check - Créer un tableau contenant chaque mot (split?)
 #Check - Itérer sur chacun des mots et je stock la première lettre dans un autre tableau
 #Check - Maintenant j'ai un tableau contenant chaque premiere lettre
 #Passer du tableau en string
 #Tout mettre en majuscule
#

CONJONCTIONS = ['of', 'by', 'the', 'at']

def acronymize(sentence)
  words = sentence.split.reject do |word|
    CONJONCTIONS.include?(word.downcase)
  end
  words.map { |word| word[0].upcase }.join

  #sentence.split.map { |word| word[0].upcase }.join
end

p acronymize("World Wide Web") == "WWW"
p acronymize("world wide web") == "WWW"
p acronymize("World wide Web") == "WWW"
p acronymize("World, wide Web") == "WWW"
p acronymize("Gaz de france") == "GDF"
p acronymize("mort de rire") == "MDR"
p acronymize("United States of America") == "USA"

