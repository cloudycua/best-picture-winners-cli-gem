# I think we can do without this class, just put the instantiation call directly in the scraper class
class BestPictureWinners::MakeMovies

  def make_movies
    BestPictureWinners::ScraperURL.scrape_movie_urls.each do |movie|
      BestPictureWinners::Movie.new(movie[:title], movie[:year], movie[:url])
    end
  end

end
