class Movie
  attr_accessor :title
  attr_reader :rank

  def initialize(title, rank)
    @title = title.capitalize
    @rank = rank
  end

  def normalized_rank
    @rank / 10
  end

  def to_s
    "#{@title} has a rank of #{@rank}"
  end

  def thumbs_up
    @rank = @rank + 1
  end

  def thumbs_down
    @rank -= 1
  end
end

movie1 = Movie.new("goonies", 10)
movie2 = Movie.new("ghostbusters", 9)
movie3 = Movie.new("goldfinger", 0)

movies = [movie1, movie2, movie3]

movies.each do |movie|
  movie.thumbs_up
  puts movie
end

puts movie1.thumbs_up
puts movie2.thumbs_down
