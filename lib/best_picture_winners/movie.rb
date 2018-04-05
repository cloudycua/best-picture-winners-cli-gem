class BestPictureWinners::Movie
  attr_accessor :title, :year, :url, :tomatometer, :audience_score, :synopsis, :critic_consensus

  @@all = []

  def initialize(movie_hash)
    movie_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
      @@all << self
    end
  end

  def self.all
    @@all
  end

  def self.print(movies)
    movies.each do |movie|
      puts "#{movie.title} (#{movie.year})"
#      puts "Synopsis: #{movie.synopsis}"
#      puts "Critics Consensus: #{movie.critic_consensus}"
      puts "Rotten Tomatoes Rating: #{movie.tomatometer}   Audience Score: #{movie.audience_score}"
    end
  end

  def self.print_alphabetically
    sorted_array = []
    sorted_array = self.all.sort_by! { |movie| movie.title }
    print(sorted_array)
  end

  def self.print_by_year
    sorted_array = []
    sorted_array = self.all.sort_by! { |movie| movie.year }.reverse!
    print(sorted_array)
  end

  def self.print_by_tomatometer
    sorted_array = []
    sorted_array = self.all.sort_by! { |movie| movie.tomatometer }.reverse!
    print(sorted_array)
  end

  def self.print_by_audience
    sorted_array = []
    sorted_array = self.all.sort_by! { |movie| movie.audience_score }.reverse!
    print(sorted_array)
  end

end
