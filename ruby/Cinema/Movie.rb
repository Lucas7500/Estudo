require_relative 'Cinema'

class Movie
  attr_accessor :title, :showtime, :cinema

  @@all = []
  
  def initialize(title, showtime)
    @title = title
    @showtime = showtime
    @@all << self
  end
end