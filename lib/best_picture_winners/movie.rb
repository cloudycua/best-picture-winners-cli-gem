class BestPictureWinners::Movie
  attr_accessor :title, :year, :url, :tomatometer, :audience_score, :genre, :runtime, :synopsis, :critic_consensus

  @@all = []

  def initialize(movie_hash)
    attributes = [:title, :year, :url, :tomatometer, :audience_score, :genre, :runtime, :synopsis, :critic_consensus]
    movie_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    attributes.each do |attribute, value|
      case self[attribute]
      when value == nil
        self.send("#{attribute}=", "")
      end
    end
    @@all << self
  end

  def self.all
    @@all
  end

end
