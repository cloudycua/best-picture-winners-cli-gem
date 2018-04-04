class BestPictureWinners::Movie
  attr_accessor :title, :year, :url, :tomatometer, :audience_score, :genre, :runtime, :synopsis, :critic_consensus

  @@all = []

  def initialize(movie_hash)
    movie_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end

end
