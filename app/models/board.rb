class Board < ActiveRecord::Base
  attr_accessible :title

  has_many :posts, :dependent => :destroy
  
  validates :title, :presence => true
end
