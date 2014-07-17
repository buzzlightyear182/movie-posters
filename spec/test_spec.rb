require 'pry'
require '../movie_finder.rb'

describe "Movie Finder" do

# movieArray = [{title: "Planes",	poster: ""},
# 	{title: "Toy Story 3",
# 	poster: "http://ia.media-imdb.com/images/M/MV5BMTgxOTY4Mjc0MF5BMl5BanBnXkFtZTcwNTA4MDQyMw@@.jpg"},
# 	{title: "Cars",
# 	poster: ""}]

posterArray = [nil, "http://image.jpg",nil]

before :each do
	@movie_db = double("MovieDB")
	@test = Posters.new(@movie_db)
end

  it "should return null if no results found" do
	@movie_db.stub(:poster).and_return([])
    expect(@test.filterPosters("Toy Story 3")).to eq []
  end

  it "should return a URL if there is a poster and nil" do
	@movie_db.stub(:poster).and_return(posterArray)
    expect(@test.filterPosters("Toy Story 3")).to eq ["http://image.jpg"]
  end

  it "should return 9 URLs given more than 9 posters" do
	@movie_db.stub(:poster).and_return(posterArray*10)
    expect(@test.filterPosters("Toy Story 3")).to eq (["http://image.jpg"] * 9)
  end

end