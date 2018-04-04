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

  def self.print

  end

end
