# Please copy/paste all three classes into this file to submit your solution!

# Start class Viewer #
class Viewer
  attr_accessor :first_name, :last_name, :ratings
  attr_reader :full_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @full_name = @first_name + " " + @last_name
    @ratings = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find{|viewer| viewer.full_name == name}
  end

  def create_rating(movie, score)
    new_rating = Rating.new(self, movie, score)
    self.ratings << new_rating
    mov = Movie.find_by_title(movie)
    mov == nil ? mov = Movie.new(movie) : mov = Movie.find_by_title(movie)
    mov.ratings << new_rating
    mov.viewers << self if !mov.viewers.include?(self)
  end

end
# End class Viewer #
# Start class Rating #
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
# End class Rating #
# Start class Movie #
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
# End class Movie #
