class StaticPagesController < ApplicationController

	def welcome
		@math = 10*10
		@last_user_name = User.last.name 
		@last_user_email = User.last.email 

		@new_user = User.new 
	end

	def create
		puts "**********"
		puts params[:user]
		puts "**********"
#this is a way to debug our code.  You can see what params passed.


		@new_user = User.new(params[:user])

		if @new_user.save
			flash[:success] = "Welcome home young one. Welcome"
			redirect_to root_url
		else 
			flash[:error] = "This is failed. Whoops!"
			redirect_to root_url
		end
	end
end

#redirect_to is a rail method. link_to is another one. They are the main two.