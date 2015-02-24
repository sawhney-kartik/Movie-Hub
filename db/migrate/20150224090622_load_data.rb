class LoadData < ActiveRecord::Migration
  def change
    down
    movie = Movie.new(:movie_name => "Fifty Shades of Grey",
                      :movie_director => "Sam Taylor-Johnson",
                      :movie_tags => "BDSM",
                      :ratings => "9 / 10",
                      :availability => "AMC")
    movie.save(:validate => false)
    movie = Movie.new(:movie_name => "Kingsman: The Secret Service",
                      :movie_director => "Matthew Vaughn",
                      :movie_tags => "spy organization",
                      :ratings => "8 / 10",
                      :availability => "Stanford theatre")
    movie.save(:validate => false)
    movie = Movie.new(:movie_name => "Hot Tub Time Machine 2",
                      :movie_director => "Steve Pink",
                      :movie_tags => "time travel",
                      :ratings => "3 / 10",
                      :availability => "AMC, Loews")
    movie.save(:validate => false)
    movie = Movie.new(:movie_name => "American Sniper",
                      :movie_director => "Clint Eastwood",
                      :movie_tags => "War hero",
                      :ratings => "8.5 / 10",
                      :availability => "The Aquarius Theatre")
    movie.save(:validate => false)
    movie = Movie.new(:movie_name => "McFarland, USA",
                      :movie_director => "Niki Caro",
                      :movie_tags => "high school coach",
                      :ratings => "8 / 10",
                      :availability => "Stanford Theatre")
    movie.save(:validate => false)
    movie = Movie.new(:movie_name => "The Wolf of Wall Street",
                      :movie_director => "Martin Scorsese",
                      :movie_tags => "Sex and drugs",
                      :ratings => "7.5 / 10",
                      :availability => "Loews")
    movie.save(:validate => false)
    movie = Movie.new(:movie_name => "Frozen",
                      :movie_director => "Chris Buck and Jennifer Lee",
                      :movie_tags => "ice queen",
                      :ratings => "10 / 10",
                      :availability => "AMC, The Aquarius Theatre, the Stanford Theatre, Loews, Regal Cinemas")
    movie.save(:validate => false)
    movie = Movie.new(:movie_name => "American Hustle",
                      :movie_director => "David O. Russell",
                      :movie_tags => "Gangsters",
                      :ratings => "8.5 / 10",
                      :availability => "Regal Cinemas")
    movie.save(:validate => false)
    movie = Movie.new(:movie_name => "Man of Steel",
                      :movie_director => "Zack Snyder",
                      :movie_tags => "Superman",
                      :ratings => "7.5 / 10",
                      :availability => "Aquarius Theatre")
    movie.save(:validate => false)
    movie = Movie.new(:movie_name => "The Imitation Game",
                      :movie_director => "Morten Tyldum",
                      :movie_tags => "Touring machines",
                      :ratings => "7 / 10",
                      :availability => "Stanford Theatre, AMC")
    movie.save(:validate => false)
  end
end
