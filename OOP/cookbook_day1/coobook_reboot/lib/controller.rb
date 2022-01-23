require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    # Ask user the name of the recipe
    name = @view.ask_for(:name)
    # Ask user the description of the recipe
    description = @view.ask_for(:description)
    # Create the instance of *Recipe*
    recipe = Recipe.new(name, description)
    # Store the recipe in the cookbook
    @cookbook.add_recipe(recipe)
    # Display the recipes
    display_recipes
  end

  def destroy
    # Display the recipes
    display_recipes
    # Ask user the index of the recipe to delete
    index = @view.ask_index
    # Delete the recipe from the cookbook
    @cookbook.remove_recipe(index)
    # Display the recipes
    display_recipes
  end

  private

  def display_recipes
    # Retrieve all recipes
    recipes = @cookbook.all
    # Display the recipes
    @view.display(recipes)
  end
end
