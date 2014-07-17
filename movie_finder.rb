require 'imdb'
require 'pry'

class MovieDB

	def initialize
		@movies = []
	end

	def getResults movie_title
		results = Imdb::Search.new(movie_title)
		@movies = results.movies.take(20)
	end

	def poster movie_title
		getResults(movie_title)
		@movies.map {|movie| movie.poster}
	end

end

class Posters
	def initialize movie_db=MovieDB.new
		@movie_db = movie_db
	end

	def filterPosters movie_title
		@finalList = @movie_db.poster(movie_title).compact.take(9)
	end
end