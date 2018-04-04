class BestPictureWinners::ScraperInfo

  def get_movie_page_from_url
#    BestPictureWinners::Movie.all.each do |movie|
      movie_page = Nokogiri::HTML(open(BestPictureWinners::Movie.all[0].url))
      critics = movie_page.css(".critic_consensus").text
      critics
#    end
  end

end
