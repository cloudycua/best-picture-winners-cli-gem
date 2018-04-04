require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
# Responsible for scraping the index page that lists all of the students.
  def self.scrape_index_page
    doc = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/9/"))
    url = doc.css(".article_movie_title a")
    url
  end

Scraper.new.scrape_index_page

end
