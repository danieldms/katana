class UsersController < ApplicationController

	def new
		@user = Customer.new		
	end

	def create
		@user = User.create(params[:user])

		if @user.save
			redirect_to(index_home_path, :notice => "Signed Up!")
		else
			render "new"	
		end
	end
	
end
