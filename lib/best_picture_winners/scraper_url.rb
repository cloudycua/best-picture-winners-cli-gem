class BestPictureWinners::ScraperURL

  def get_url_pages
    all_url_pages = []
    all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/9/"))
#    all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/8/"))
#    all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/7/"))
#    all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/6/"))
#    all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/5/"))
#    all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/4/"))
#    all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/3/"))
#    all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/2/"))
#    all_url_pages << Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/oscars-best-and-worst-best-pictures/"))
    all_url_pages
  end

  def scrape_movie_urls
    movies = []
    pages = get_url_pages.size
    index = 0
    while index < pages do
      get_url_pages[index].css(".article_movie_title").each do |movie|
        movie_title = movie.css("h2 a").text
        movie_year = movie.css(".start-year").text.slice!(1,4)
        movie_url = movie.css("h2 a").attr("href").value
        movies << {title: movie_title, year: movie_year, url: movie_url}
      end
      index += 1
    end
    movies
  end

  def make_movies
    scrape_movie_urls.each do |movie|
      BestPictureWinners::Movie.new(movie[:title], movie[:year], movie[:url])
    end
  end

end
