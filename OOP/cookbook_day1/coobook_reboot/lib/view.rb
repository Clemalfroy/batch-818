class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} #{recipe.name} #{recipe.description}"
    end
  end

  def ask_for(stuff)
    puts "What is the #{stuff} of the recipe?"
    gets.chomp
  end

  def ask_index
    puts "What the index of the recipe to delete"
    gets.chomp.to_i - 1
  end
end
