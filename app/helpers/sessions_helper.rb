module SessionsHelper
	def sign_in(user)
		#cookies.permanent.signed[:remember_token] = [user.id]
		session[:user] = user.id
		self.current_user = user
	end

	def sign_out
		session[:user] = nil
		self.current_user= nil
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		#@current_user ||= user_from_remeber_token
		@current_user ||= User.find_by_id(session[:user])
	end

	def signed_in?
		!current_user.nil?
	end

	def admin_signed_in?
		signed_in? && current_user.is_admin?
	end

	def block_admin_page
		redirect_to	request.referer unless admin_signed_in?
	end

end
