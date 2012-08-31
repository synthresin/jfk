class UsersController < ApplicationController

	def index
	end

	

	def new
		@user = User.new
	end


	def create
		@user =  User.new(params[:user])
		if @user.save
			#전시회 신청 유도 페이지로 고
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
	end
end
