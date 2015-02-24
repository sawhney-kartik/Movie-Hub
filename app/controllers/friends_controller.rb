class FriendsController < ApplicationController
	def index
   @user = User.find(session[:id])
   end

   def new
   @user = User.find(session[:id])
      @friendInfo = Friend.new
      if !session[:id] 
         flash.alert="You must login to send a friend request."
         redirect_to(:controller => 'users', :action => 'login')
      end
   end

   def create
      @friendInfo = Friend.new(friend_params(params[:friend]))
      if @friendInfo.save
         redirect_to(:action => 'index')
      else
         flash[:error] = @friendInfo.errors.full_messages.to_sentence
         redirect_to :back
      end
   end

   private
   def friend_params(params)
      return params.permit(:user_id, :user_id2, :date_time)
   end
end
