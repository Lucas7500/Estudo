class Cinema
  attr_accessor :name, :location
  
  def initialize(name, location)
      @name = name
      @location = location
      @movies = []
  end

  def add_movie(movie)
    @movies << movie
    movie.cinema = self
  end
end