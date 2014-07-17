require 'sinatra'
require 'PStore'
#require 'yaml/store'
# require 'json'
require 'imdb'

get '/' do
	erb :index
end

post '/results' do
	puts "You sent #{params.inspect}"			#prints on console

	movieResults = Imdb::Search.new(params['movie_title']);
	image_list ||= []
	no_posters ||= []

	erb :index
end

def filterPosters(movie_db)
	movie_db.movies.each do |x|
		image = x.poster
		if image == ""
			no_posters << image
		else
			image_list << image
		end
	end

	@posters = image_list

end

class MovieDB

	def self.getResults movie_title
		results = Imdb::Search.new(movie_title);
		results
	end

end