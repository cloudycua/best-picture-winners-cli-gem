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

  # our finder class method might look something like this
  # def self.find_by(title)
  #   all.detect {|movie| movie.title.downcase == title.downcase}
  # end

end
