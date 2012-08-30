class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.authenticate(params[:session][:email],params[:session][:password])
		
		if user.nil?
			render 'new'
		else
			# 어드민이면 관리페이지, 업체면 자기 페이지
			
		end
	end

	def destroy
	end
end
