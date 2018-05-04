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

end
