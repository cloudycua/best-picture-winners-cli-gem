class BestPictureWinners::Movie
  attr_accessor :title, :year, :url, :tomatometer, :audience_score, :synopsis, :critic_consensus

  @@all = []

  def initialize(title, year, url)
    @title = title
    @year = year
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.print(movies)
    movies.each do |movie|
      puts "#{movie.title} (#{movie.year})"
#      puts "Synopsis: #{movie.synopsis}"
#      puts "Critics Consensus: #{movie.critic_consensus}"
      puts "RT: #{movie.tomatometer}%   AS: #{movie.audience_score}%"
      puts " "
    end
  end

  def self.print_alphabetically
    sorted_array = []
    sorted_array = self.all.sort_by! { |movie| movie.title }
    puts " "
    puts "Best Picture Award Winners sorted alphabetically"
    puts " "
    print(sorted_array)
  end

  def self.print_by_year
    sorted_array = []
    sorted_array = self.all.sort_by! { |movie| movie.year }.reverse!
    puts " "
    puts "Best Picture Award Winners sorted year"
    puts " "
    print(sorted_array)
  end

  def self.print_by_tomatometer
    sorted_array = []
    sorted_array = self.all.sort_by! { |movie| movie.tomatometer }.reverse!
    puts " "
    puts "Best Picture Award Winners sorted by Rotten Tomatoes Critics Rating (RT)"
    puts " "
    print(sorted_array)
  end

  def self.print_by_audience
    sorted_array = []
    sorted_array = self.all.sort_by! { |movie| movie.audience_score }.reverse!
    puts " "
    puts "Best Picture Award Winners sorted by Audience Score (AS)"
    puts " "
    print(sorted_array)
  end

end
