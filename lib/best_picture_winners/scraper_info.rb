class BestPictureWinners::ScraperInfo

  def get_movie_page_from_url
    index = 0
    num_movies = Movie.all.size
    while index < num_movies do
      Nokogiri::HTML(open(BestPictureWinners::Movie.all[index].url))
      BestPictureWinners::Movie.all[index].critic_consensus = movie_page.css("div#scorePanel .col-full-xs p.critic_consensus").text.gsub("Critic Consensus:","").lstrip
      BestPictureWinners::Movie.all[index].audience_score = movie_page.css(".audience-score .meter-value").text.lstrip
      BestPictureWinners::Movie.all[index].tomatometer = movie_page.css("#all-critics-numbers .critic-score .meter-value").text.lstrip
      BestPictureWinners::Movie.all[index].synopsis = movie_page.css("#movieSynopsis").text.lstrip
      index += 1
    end
  end

end
