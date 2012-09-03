class Post < ActiveRecord::Base
  attr_accessible :title, :content

  belongs_to :board

  validates :title, 	:presence => true
  validates :content,	:presence => true
  validates :board_id, 	:presence => true
end