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
