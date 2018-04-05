class BestPictureWinners::ScraperInfo

  def add_movie_info_from_url
    index = 0
    num_movies = BestPictureWinners::Movie.all.size
    while index < num_movies do
      movie_page = Nokogiri::HTML(open(BestPictureWinners::Movie.all[index].url))
#      BestPictureWinners::Movie.all[index].critic_consensus = movie_page.css("div#scorePanel .col-full-xs p.critic_consensus").text.gsub("Critic Consensus:","").lstrip
      BestPictureWinners::Movie.all[index].audience_score = movie_page.css(".audience-score .meter-value").text.lstrip.chop.to_i
      BestPictureWinners::Movie.all[index].tomatometer = movie_page.css("#all-critics-numbers .critic-score .meter-value").text.lstrip.to_i
#      BestPictureWinners::Movie.all[index].synopsis = movie_page.css("#movieSynopsis").text.lstrip
      index += 1
    end
  end

end
