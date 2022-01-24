class View
  def display(recipes)
    puts 'Here are the recipes:'
    puts '----------------------------'
    recipes.each_with_index do |recipe, index|
      prep_time = recipe.prep_time ? "(#{recipe.prep_time} mins)" : ''
      rating = recipe.rating ? "#{recipe.rating} / 5" : ''
      done = recipe.done? ? '[X]' : '[ ]'
      puts "#{done} #{index + 1}. #{recipe.name}: #{recipe.description} #{prep_time} #{rating}"
    end
    puts '----------------------------'
  end

  def ask_for(stuff)
    puts "#{stuff}?"
    gets.chomp
  end

  def ask_index(action)
    puts "What the index of the recipe to #{action}"
    gets.chomp.to_i - 1
  end
end
