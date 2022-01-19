require 'open-uri'
require 'nokogiri'

def get_etsy_titles_from_search(query)
  html_content = URI.open("https://www.etsy.com/search?q=#{query}").read
  doc = Nokogiri::HTML(html_content)
  title_css_selector = 'h3.v2-listing-card__title'
  titles = []
  doc.search(title_css_selector).each do |element|
    titles << element.text.strip
  end
  return titles
end


