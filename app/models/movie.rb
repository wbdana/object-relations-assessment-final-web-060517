class Movie
  attr_accessor :title
  attr_reader :ratings, :viewers

  @@all = []

  def initialize(title)
    @title = title
    @ratings = []
    @viewers = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.find{|movie| movie.title == title}
  end

  def average_rating
    count = 0
    self.ratings.map do |rating|
      count += 1
      rating.score
    end.inject(:+) / count
  end

end
