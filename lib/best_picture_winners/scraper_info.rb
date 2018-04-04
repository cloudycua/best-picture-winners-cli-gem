class BestPictureWinners::ScraperInfo

  def get_movie_page_from_url
#    BestPictureWinners::Movie.all.each do |movie|
#      movie_page = Nokogiri::HTML(open(movie.url))
#      movie[:critic_consensus] = movie_page.css("div#scorePanel .col-full-xs .critic_consensus").text

      movie_page = Nokogiri::HTML(open(BestPictureWinners::Movie.all[0].url))
      BestPictureWinners::Movie.all[0].critic_consensus = movie_page.css("div#scorePanel .col-full-xs p.critic_consensus").text.gsub("Critic Consensus:","").lstrip
      BestPictureWinners::Movie.all[0].audience_score = movie_page.css(".audience-score .meter-value").text.lstrip
      BestPictureWinners::Movie.all[0].tomatometer = movie_page.css("#all-critics-numbers .critic-score .meter-value").text.lstrip
      BestPictureWinners::Movie.all[0].synopsis = movie_page.css("#movieSynopsis").text.lstrip
      movie_page.css("li .meta-label").each do |category|
        binding.pry
        if category.text = "Genre:"
          BestPictureWinners::Movie.all[0].genre = category.css(".meta-value").text
        end
      end

      BestPictureWinners::Movie.all[0].genre

#    end
  end

end
