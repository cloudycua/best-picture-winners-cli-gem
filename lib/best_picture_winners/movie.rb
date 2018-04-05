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

  def self.print(array)

  end

  def self.print_alphabetically
    sorted_array = []
    self.all.sort_by! { |movie| movie[:title] }


  end

  def self.print_by_letter
  end

  def self.print_by_year
  end

  def self.print_by_tomatometer
  end

  def self.print_by_audience
  end

end
