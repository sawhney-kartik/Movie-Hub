class MoviesController < ApplicationController
	def index
@all_movies = Movie.find(:all)
   end

   def show
      begin
         @movie = Movie.find(params[:id])
         @all_comments = @movie.comments.find(:all)
         rescue
         render "error"
      end
   end

   def new
      @newMovie = Movie.new
      if !session[:id] 
         flash.alert="You must login to add a movie."
         redirect_to(:controller => 'users', :action => 'login')
      end
   end

   def create
      @newMovie = Movie.new(:user_id => session[:id], :movie_name => params[:movie][:movie_name],
         :movie_director => params[:movie][:movie_director], :movie_tags => params[:movie][:movie_tags], :ratings => params[:movie][:ratings], :availability => params[:movie][:availability], :date_time => Time.now)
         if @newMovie.save
            redirect_to :controller => 'users', :action => 'show', :id => session[:id]
         else
         flash[:error] = @newMovie.errors.full_messages.to_sentence
            redirect_to :back
         end
      end

   def search
      @movies = Array.new #Will store the movies to be displayed
      allMovies = Movie.find(:all)
      if params[:title] and params[:title]!=""
         searchText = params[:title].downcase
         for movie in allMovies
            if movie.movie_name.downcase.include?(searchText)
               @movies.append(movie)
            end
         end
      end
      if params[:director] and params[:director]!=""
         searchText = params[:director].downcase
         for movie in allMovies
            if movie.movie_director.downcase.include?(searchText)
               @movies.append(movie)
            end
         end
end
      if params[:genre] and params[:genre]!=""
         searchText = params[:genre].downcase
         for movie in allMovies
            if movie.movie_tags.downcase.include?(searchText)
               @movies.append(movie)
            end
         end
end
      if params[:availability] and params[:availability]!=""
         searchText = params[:availability].downcase
         for movie in allMovies
            if movie.availability.downcase.include?(searchText)
               @movies.append(movie)
            end
         end
end
if params[:title]=="" and params[:genre]=="" and params[:director]=="" and params[:availability]==""
@movies = Movie.find(:all)
end
         @movies = @movies.flatten
         @movies = @movies.uniq
   end

   def advsearch
   end

   def searchForm
   end

=begin
def download_movie
      if session[:id] 
         @downloadmovie = movie.find(params[:movieID])
send_file Rails.root.join('app', 'assets', 'movies', @downloadmovie.file_name), :x_sendfile => true
else
         flash.alert="You must login to download the requested textmovie."
         redirect_to(:controller => 'users', :action => 'login')
      end
end
=end
end
