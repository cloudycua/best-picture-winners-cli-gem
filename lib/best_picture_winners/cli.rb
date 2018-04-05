class BestPictureWinners::CLI

  def call
    puts "Welcome to the Academy Award Best Picture Winner database!"
    puts "Please wait while we upload the database."
    # Scrape Best Picture individual movie URL's and create a movie object for each with title, year and url
    BestPictureWinners::ScraperURL.new.make_movies
    # Scrape movie data from individual movie pages using URL from the ScraperURL
    BestPictureWinners::ScraperInfo.new.add_movie_info_from_url
    start
  end

  def start
    puts "The Oscar winners' list can be shown any of the following ways:"
    puts "1 - Alphabetically"
    puts "2 - Starting with the letter: "
    puts "3 - By year"
    puts "4 - By Rotten Tomatoes' Critics Tomatometer"
    puts "5 - By Rotten Tomatoes' Audience Score"
    valid_entry([1,2,3,4,5])

  end

  def valid_entry(range)
    entry = gets.chomp.to_i
    if range.include?(entry)
      entry
    else
      until range.include?(entry) do
        puts "Invalid entry. Please select enter a number from #{range.min} to #{range.max}."
        entry = gets.chomp.to_i
      end
      entry
    end
  end


#    puts BestPictureWinners::Movie.all[10].tomatometer
    #    If by year, ask for all years or a range of years
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
