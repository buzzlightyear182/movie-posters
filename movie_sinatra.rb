require 'sinatra'
require 'imdb'
require_relative 'movie_finder'
require 'pry'

get '/' do
	erb :index
end

post '/results' do
	puts "You sent #{params.inspect}"

		@posters = Posters.new.filterPosters(params["movie_title"])

	erb :index
end