class BestPictureWinners::ScraperInfo

  def scrape_info_using_url

      movie.title


  def get_movie_page_from_url
    BestPictureWinners::Movie.all.each do |movie|
    movie_page = Nokogiri::HTML(open(movie.url))
    
  end



  end

end
