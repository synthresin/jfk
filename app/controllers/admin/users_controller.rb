class Admin::UsersController < ApplicationController

	layout 'admin'
	
	def index 
		@users = User.all
	end

	def show
	end

end
