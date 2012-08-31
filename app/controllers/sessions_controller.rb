# encoding: utf-8
class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.authenticate(params[:session][:email],params[:session][:password])
		
		if user.nil?
			flash.now[:error] = "Invalid email/password combination"
			render 'new'
		else
			# 어드민이면 관리페이지, 업체면 자기 페이지
			sign_in user
			redirect_to user
		end
	end

	def destroy
		sign_out
		redirect_to request.referer
	end
end
