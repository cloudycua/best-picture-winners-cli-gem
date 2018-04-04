class BestPictureWinners::CLI

  def call
    start
  end

  def start
    puts "Welcome!"
    puts BestPictureWinners::ScraperURL.new.get_url_page
    # How would you like the Best Picture winners to be sorted?
    # 1: alphabetically
    #    All movies or movies that start with a particular letter
    # 2: by year
    #    If by year, ask for all years or a range of years
    # 3: by imdb_rating
    #    Ask for all movies, above a certain rating, or top X movies
    # 4: by rotten_tomatoes_rating
    #    Ask for all movies, above a certain rating, or top X movies
    # validate entry else re-enter
    # Ask if user would like the list to include a synopsis of the movie
    # Ask user if they would like the list to include the critic_consensus
    # 1-print list alphabetically with or without synopsis or critic_consensus
    # 2-print list by year with or without synopsis or critic_consensus
    # 3-print list by imdb_rating with or without synopsis or critic_consensus
    # 4-print list by rotten_tomatoes_rating with or without synopsis or critic_consensus
    # Ask if user would like to see another list
    # Exit
  end

end
