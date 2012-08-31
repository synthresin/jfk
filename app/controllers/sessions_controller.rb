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
			if self.current_user.is_admin?
				#어드민 기본 페이지로
			else

			end
		end
	end

	def destroy
		self.current_user = nil
	end
end
