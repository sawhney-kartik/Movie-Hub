class CommentsController < ApplicationController
	def new
      @commentInfo = Comment.new
      if session[:id] 
         @movie = Movie.find_by_id(params[:movie_id])
         @movieID = params[:movie_id]
      else
         flash.alert="You must login to post a comment."
         redirect_to(:controller => 'users', :action => 'login')
      end
   end

   def create
      @commentInfo = Comment.new(comment_params(params[:comment]))
      if @commentInfo.save
         redirect_to(:controller => 'movies', :action => 'show', :id => params[:comment][:movie_id])
      else
         flash[:error] = @commentInfo.errors.full_messages.to_sentence
         redirect_to :back
      end
   end

   private
   def comment_params(params)
      return params.permit(:comment, :movie_id, :user_id, :date_time)
   end
end
