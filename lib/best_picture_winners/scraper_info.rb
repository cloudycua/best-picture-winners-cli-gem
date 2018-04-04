class BestPictureWinners::ScraperInfo

  def get_movie_page_from_url
#    BestPictureWinners::Movie.all.each do |movie|
#      movie_page = Nokogiri::HTML(open(movie.url))
#      movie[:critic_consensus] = movie_page.css("div#scorePanel .col-full-xs .critic_consensus").text

      movie_page = Nokogiri::HTML(open(BestPictureWinners::Movie.all[0].url))
      BestPictureWinners::Movie.all[0].critic_consensus = movie_page.css("div#scorePanel .col-full-xs p.critic_consensus").text.gsub("Critic Consensus:","").lstrip
#      BestPictureWinners::Movie.all[0][:critic_consensus] = critics
#      BestPictureWinners::Movie.all[0][:critic_consensus] = movie_page.css("div#scorePanel .col-full-xs .critic_consensus").text
#      BestPictureWinners::Movie.all[0]

#    end
  end

end
