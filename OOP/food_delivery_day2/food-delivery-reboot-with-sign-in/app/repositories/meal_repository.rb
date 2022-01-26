require "csv"
require_relative "base_repository"
require_relative "../models/meal"

class MealRepository < BaseRepository
  private

  def row_to_element(row)
    row[:price] = row[:price].to_i
    Meal.new(row)
  end

  def headers
    ["id", "name", "price"]
  end

  def element_to_row(meal)
    [meal.id, meal.name, meal.price]
  end
end
