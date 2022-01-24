require_relative 'view'
require_relative 'recipe'
require_relative 'scrap_allrecipes_service'

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
    name = @view.ask_for("What is the name of the recipe")
    # Ask user the description of the recipe
    description = @view.ask_for("What is the description of the recipe")
    # Ask user the preparation time of the recipe
    prep_time = @view.ask_for("What is the preparation time of the recipe (in mins)")
    # Ask user the rating of the recipe
    rating = @view.ask_for("What is the rating of the recipe (from 0 to 5)")
    # Create the instance of *Recipe*
    recipe = Recipe.new(name: name, description: description, prep_time: prep_time, rating: rating)
    # Store the recipe in the cookbook
    @cookbook.add_recipe(recipe)
    # Display the recipes
    display_recipes
  end

  def mark_a_recipe_as_done
    # Display the recipes
    display_recipes
    # Ask user the index of the recipe to delete
    index = @view.ask_index('mark as done')
    # Retrieve the recipe and mark it as done thanks to the Cookbook
    @cookbook.mark_recipe_as_done(index)
    # Display the recipes
    display_recipes
  end

  def destroy
    # Display the recipes
    display_recipes
    # Ask user the index of the recipe to delete
    index = @view.ask_index('delete')
    # Delete the recipe from the cookbook
    @cookbook.remove_recipe(index)
    # Display the recipes
    display_recipes
  end

  def import
    # Ask a user for a keyword to search
    ingredient = @view.ask_for("Tell us the recipes's ingredient you're looking for")
    # Scrap the first 5 recipes from AllRecipes
    recipe_array = ScrapAllrecipesService.new(ingredient).call
    # Display them in an indexed list
    @view.display(recipe_array)
    # Ask the user which recipe they want to import (ask for an index)
    index = @view.ask_index('import')
    # Add it to the Cookbook
    recipe = recipe_array[index]
    @cookbook.add_recipe(recipe)
  end

  private

  def display_recipes
    # Retrieve all recipes
    recipes = @cookbook.all
    # Display the recipes
    @view.display(recipes)
  end
end
