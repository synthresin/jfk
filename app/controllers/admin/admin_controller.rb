# encoding: utf-8
class Admin::AdminController < ApplicationController
  #before_filter :authenticated_user!
  before_filter :authenticated_admin
  
  layout 'admin'
  
  def authenticated_admin
    if !current_user.is_admin?
      redirect_to root_path, :alert => '권한이 없습니다.'
    end
  end
end