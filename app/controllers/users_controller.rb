class UsersController < ApplicationController
   def index
      @all_users = User.find(:all)
   end

   def show
      begin
         @username = User.find(params[:id])
         @all_movies = @username.movies.find(:all)
         @all_friends = @username.friends.find(:all)
         rescue
         render "error"
      end
   end

   def login
   end

   def post_login
      if params[:user][:username].empty? 
         flash.alert="Username field cannot be empty."
         redirect_to :back
      # elsif params[:user][:password].empty?
      #    flash.alert="Password field cannot be empty."
      #    redirect_to :back
      else
         user = User.find_by_login(params[:user][:username])
         if user then
            if user.password_valid?(params[:user][:password])
               session[:id] = user.id
               session[:name] = user.first_name
               redirect_to(:action => 'show', :id => session[:id])
            else
               flash.alert="The password you entered is incorrect."
               redirect_to(:action => 'login')
            end
          else
            flash.alert="This username does not exist. Retry!"
            redirect_to(:action => 'login')
         end
      end
   end

   def logout
      reset_session
      redirect_to(:action => 'login')
   end

   def new
      @user = User.new
   end

   def create
      @user = User.new(user_params(params[:user]))
      if @user.save
         flash.notice="Registration completed. Login to use the website."
         redirect_to(:action => 'login')
      else
         flash[:error] = @user.errors.full_messages.to_sentence
         redirect_to :back
      end
   end

   def edit
      @username = User.find(params[:id])
   end

   def update
      @username = User.find(params[:id])
   if @username.password_valid?(params[:user][:oldPassword])
      if @username.update(user_params1(params[:user]))
         flash.notice="Profile updated."
         redirect_to(:controller => "users", :action => "profile")
      else
         flash[:error] = @username.errors.full_messages.to_sentence
         redirect_to :back
end
else
flash.alert="The old password that you entered is incorrect. Retry!"
         redirect_to :back
      end
   end

   def profile
      if session[:id] 
         @user = User.find(session[:id])
      else
         flash.alert="You must login to view your profile."
         redirect_to(:controller => 'users', :action => 'login')
        end
   end

   def recommendations
      if !session[:id] 
         flash.alert="You must login to view our recommendations."
         redirect_to(:controller => 'users', :action => 'login')
        end
   end

   private
   def user_params(params)
      return params.permit(:first_name, :last_name, :login, :password, :password_confirmation, :interests, :ad_interests)
   end

   def user_params1(params)
      return params.permit(:interests,:ad_interests,:password, :password_confirmation)
   end
end
