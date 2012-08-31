class Admin::UsersController < ApplicationController

	layout 'admin'
	
	def index 
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			# 유저 목록정도로 가는게 좋을듯.
			redirect_to admin_company_path(@user)
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

end
