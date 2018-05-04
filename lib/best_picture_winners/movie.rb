class BestPictureWinners::Movie
  attr_accessor :title, :year, :url, :tomatometer, :audience_score, :synopsis, :critic_consensus, :rating, :genre, :runtime

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
      puts "RT: #{movie.tomatometer}%   AS: #{movie.audience_score}%"
      puts " "
    end
  end

end
