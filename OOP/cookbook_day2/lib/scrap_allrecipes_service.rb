require "nokogiri"
require "open-uri"

class ScrapAllrecipesService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    # Make an HTTP request to the recipe’s website with our keyword
    http_query = "https://www.allrecipes.com/search/results/?search=#{@keyword}"
    doc = Nokogiri::HTML(URI.open(http_query).read)
    # Parse the HTML document to extract the first 5 recipes suggested and store them in an Array
    recipe_array = []
    doc.search('.card__detailsContainer').first(5).each do |element|
      name = element.search('.card__title').text.strip
      description = element.search('.card__summary').text.strip
      if element.search('.review-star-text').first
        rating = element.search('.review-star-text').text.strip.match(/\d\.?\d*/)[0]
      end
      recipe_url = element.search('.card__titleLink').attribute('href').value
      recipe_doc = Nokogiri::HTML(URI.open(recipe_url).read)
      prep_el = recipe_doc.search('.recipe-meta-container .recipe-meta-item').find do |el|
        el.text.strip.match?(/prep/i)
      end
      prep_time = prep_el.text.strip.match(/prep: (\d+) (\w*)/i)[1] if prep_el
      recipe_array << Recipe.new(name: name, description: description, prep_time: prep_time, rating: rating)
    end
    recipe_array
  end
end
