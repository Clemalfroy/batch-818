require_relative '../views/meals_view'

class MealsController
  def initialize(meals_repository)
    @meals_repository = meals_repository
    @meals_view = MealsView.new
  end

  def list
    display_meals
  end

  def add
    # Ask user for a name
    name = @meals_view.ask_for("Enter a new name!")
    # Ask user for a price
    price = @meals_view.ask_for("Enter a new price for #{name}!")
    # Create a new Meal instance with the data given by user
    meal = Meal.new(name: name, price: price.to_i)
    # Store it (in the repo)
    @meals_repository.create(meal)
  end

  private

  def display_meals
    # Get all the meals (from the repo)
    meals = @meals_repository.all
    # Display the meals to user
    @meals_view.display(meals)
  end
end
