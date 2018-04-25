class BestPictureWinners::CLI

  def call
    puts " "
    puts "Welcome to the Academy Award Best Picture Winner database!"
    puts "Please wait while we upload the database. This might take a few minutes."
    puts " "
    # Scrape Best Picture individual movie URL's and create a movie object for each with title, year and url
    BestPictureWinners::ScraperURL.new.make_movies
    # Scrape movie data from individual movie pages using URL from the ScraperURL
    BestPictureWinners::ScraperInfo.new.add_movie_info_from_url
    start
  end

  def start
    puts "The Oscar winners' list can be shown any of the following ways:"
    puts " "
    puts "1 - Alphabetically"
    puts "2 - By year"
    puts "3 - By Rotten Tomatoes' Critics Tomatometer (RT)"
    puts "4 - By Rotten Tomatoes' Audience Score (AS)"
    puts " "
    puts "Please enter a number:"
    valid_entries = [1,2,3,4]
    case valid_number_entry(valid_entries)
    when 1
      BestPictureWinners::Movie.print_alphabetically
    when 2
      BestPictureWinners::Movie.print_by_year
    when 3
      BestPictureWinners::Movie.print_by_tomatometer
    else
      BestPictureWinners::Movie.print_by_audience
    end
    ask_for_a_movie
    play_again
  end

  def ask_for_a_movie
    puts " "
    puts "Please enter the year or title of a movie if you would like more details, or 'exit' to leave the program:"
    entry = gets.chomp
    if entry.downcase == "exit"
      puts " "
      puts "Thanks for using our Best Picture Winners database. Goodbye!"
      puts " "
    else
      if valid_movies.include?(entry.downcase)
        #lookup movie
        BestPictureWinners::Movie.all.each do |movie|
          if movie.title.downcase == entry.downcase
            puts " "
            BestPictureWinners::Movie.print_movie_details(movie)
          end
        end
      elsif valid_years.include?(entry)
        BestPictureWinners::Movie.all.each do |movie|
          if movie.year == entry
            puts " "
            BestPictureWinners::Movie.print_movie_details(movie)
          end
        end
      else
        puts " "
        puts "There are no Best Picture Winners by that title or year."
        ask_for_a_movie
      end
    end
  end

  def valid_years
    year_array = []
    BestPictureWinners::Movie.all.each do |movie|
      year_array << movie.year
    end
    year_array
  end

  def valid_movies
    title_array = []
    BestPictureWinners::Movie.all.each do |movie|
      title_array << movie.title.downcase
    end
    title_array
  end

  def play_again
    puts " "
    puts "Would you like to see another list?"
    entry = gets.chomp.downcase
    if !["y","n"].include?(entry)
      until ["y","n"].include?(entry) do
        puts "Invalid entry. Please enter Y or N to see another list."
        entry = gets.chomp.downcase
      end
    end
    if entry == "y"
      puts " "
      start
    elsif entry == "n"
      puts " "
      puts "Thanks for using our Best Picture Winners database. Goodbye!"
      puts " "
    end
  end

  def valid_number_entry(valid_entries)
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
