class Rating
  attr_accessor :score, :viewer, :movie

  @@all = []

  def initialize(viewer, movie, score)
    @viewer = viewer
    Movie.find_by_title(movie) ? @movie = Movie.find_by_title(movie) : @movie = Movie.new(movie)
    @score = score
    @@all << self
  end

  def self.all
    @@all
  end


end
