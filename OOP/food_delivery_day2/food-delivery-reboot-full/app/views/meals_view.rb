class MealsView
  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} -- #{meal.name}: #{meal.price}"
    end
  end

  def ask_for(message)
    puts message
    gets.chomp
  end
end
