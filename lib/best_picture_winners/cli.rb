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
    case valid_entry
    when 1
      BestPictureWinners::Movie.print_alphabetically
    when 2
      BestPictureWinners::Movie.print_by_letter
    when 3
      BestPictureWinners::Movie.print_by_year
    when 4
      BestPictureWinners::Movie.print_by_tomatometer
    else
      BestPictureWinners::Movie.print_by_audience
    end
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

end
