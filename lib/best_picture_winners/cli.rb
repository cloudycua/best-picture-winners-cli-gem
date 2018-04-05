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
    BestPictureWinners::Movie.all.each do |movie|
      puts movie.title
    end
    puts "The Oscar winners' list can be shown any of the following ways:"
    puts "1 - Alphabetically"
    puts "2 - By year"
    puts "3 - By Rotten Tomatoes' Critics Tomatometer"
    puts "4 - By Rotten Tomatoes' Audience Score"
    puts "Please enter a number:"
    case valid_number_entry
    when 1
      BestPictureWinners::Movie.print_alphabetically
    when 2
      BestPictureWinners::Movie.print_by_year
    when 3
      BestPictureWinners::Movie.print_by_tomatometer
    else
      BestPictureWinners::Movie.print_by_audience
    end
  end

  def valid_number_entry
    valid_entries = [1,2,3,4]
    entry = gets.chomp.to_i
    if valid_entries.include?(entry)
      entry
    else
      until valid_entries.include?(entry) do
        puts "Invalid entry. Please select enter a number from '#{valid_entries.min}' to '#{valid_entries.max}'."
        entry = gets.chomp.to_i
      end
      entry
    end
  end

end
