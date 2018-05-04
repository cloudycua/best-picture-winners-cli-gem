class BestPictureWinners::CLI

  def call
    puts " "
    puts "Welcome to the Academy Award Best Picture Winner database!"
    puts "Please wait while we upload the database. This might take a few minutes."
    puts " "
    # Scrape Best Picture individual movie URL's and create a movie object for each with title, year and url
    BestPictureWinners::MakeMovies.new.make_movies
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
      print_alphabetically
    when 2
      print_by_year
    when 3
      print_by_tomatometer
    else
      print_by_audience
    end
    ask_for_a_movie
  end

  def ask_for_a_movie
    puts " "
    puts "Please enter the year or title of a movie if you would like more details, or 'exit' to leave the program:"
    entry = gets.chomp
    if entry.downcase == "exit"
      puts " "
      puts "Thanks for using our Best Picture Winners database. Goodbye!"
      puts " "
    elsif valid_movies.include?(entry.downcase)
      #lookup movie
      # might be nice to build a self.find or self.find_by class method
      # these each calls are a bit cumbersome, and we can extract this lookup logic
      # and use Ruby's finder iterators like #detect
      # something like Movie.find or Movie.find_by
      # see the Movie class for an example
      BestPictureWinners::Movie.all.each do |movie|
        if movie.title.downcase == entry.downcase
          puts " "
          print_movie_details(movie)
        end
      end
      play_again
    elsif valid_years.include?(entry)
      BestPictureWinners::Movie.all.each do |movie|
        if movie.year == entry
          puts " "
          print_movie_details(movie)
        end
      end
      play_again
    else
      puts " "
      puts "There are no Best Picture Winners by that title or year."
      ask_for_a_movie
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
    if !["y","n","yes","no"].include?(entry)
      until ["y","n","yes","no"].include?(entry) do
        puts "Invalid entry. Please enter Y or N to see another list."
        entry = gets.chomp.downcase
      end
    end
    if entry == "y" || entry == "yes"
      puts " "
      start
    elsif entry == "n" || entry == "no"
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

  def print(movies)
    movies.each do |movie|
      puts "#{movie.title} (#{movie.year})"
      puts "RT: #{movie.tomatometer}%   AS: #{movie.audience_score}%"
      puts " "
    end
  end

  def print_alphabetically
    sorted_array = []
    sorted_array = BestPictureWinners::Movie.all.sort_by! { |movie| movie.title }
    puts " "
    puts "Best Picture Award Winners sorted alphabetically"
    puts " "
    print(sorted_array)
  end

  def print_by_year
    sorted_array = []
    sorted_array = BestPictureWinners::Movie.all.sort_by! { |movie| movie.year }.reverse!
    puts " "
    puts "Best Picture Award Winners sorted year"
    puts " "
    print(sorted_array)
  end

  def print_by_tomatometer
    sorted_array = []
    sorted_array = BestPictureWinners::Movie.all.sort_by! { |movie| movie.tomatometer }.reverse!
    puts " "
    puts "Best Picture Award Winners sorted by Rotten Tomatoes Critics Rating (RT)"
    puts " "
    print(sorted_array)
  end

  def print_by_audience
    sorted_array = []
    sorted_array = BestPictureWinners::Movie.all.sort_by! { |movie| movie.audience_score }.reverse!
    puts " "
    puts "Best Picture Award Winners sorted by Audience Score (AS)"
    puts " "
    print(sorted_array)
  end

  def print_movie_details(movie)
    puts "#{movie.title.upcase} (#{movie.year})"
    puts " "
    puts "Genre: #{movie.genre}   Rating: #{movie.rating}   Runtime: #{movie.runtime}"
    puts " "
    puts "Synopsis: #{movie.synopsis}"
    puts " "
    puts "Critics Consensus: #{movie.critic_consensus}"
    puts " "
    puts "Tomatometer: #{movie.tomatometer}%   Audience Score: #{movie.audience_score}%"
    puts " "
  end

end
