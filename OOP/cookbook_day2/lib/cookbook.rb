require "csv"
require_relative "recipe"

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    push_csv
  end

  def mark_recipe_as_done(index)
    recipe = @recipes[index]
    recipe.mark_as_done!
    push_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    push_csv
  end

  private

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, options) do |row|
      row[:prep_time] = row[:prep_time].to_i if row[:prep_time]
      row[:rating] = row[:rating].to_f if row[:rating]
      row[:done] = row[:done] == 'true'
      @recipes << Recipe.new(row)
    end
  end

  def push_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << %w[name description prep_time rating done]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.rating, recipe.done?]
      end
    end
  end
end
