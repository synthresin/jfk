# encoding: utf-8
require 'bcrypt'

class User < ActiveRecord::Base
  # attr_accessor :password
  # attr_accessible :title, :body
  include BCrypt

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :password, :presence => {:message => '비밀번호를 입력해주세요.'},
                       :confirmation => {:message => '비밀번호를 정확하게 두번 입력하지 않았습니다.'},
                       :on => :create

  validates :email, :format => { :with => email_regex, :message => '잘못된 이메일 형식입니다.' }, 
  			:presence => {:message => '이메일 주소를 입력해주세요.'}, 
  			:uniqueness => true
  
  def password
  	@password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
  	@password = Password.create(new_password)
    self.encrypted_password = @password
  end
end
