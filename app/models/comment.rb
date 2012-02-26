class Comment < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id
  belongs_to :idea, :foreign_key => :idea_id
  
  attr_accessible :comment
  
  default_scope :order => 'comments.created_at DESC'
  
  validates :comment, :presence => true, :length => { :maximum => 150 }
  validates :user_id, :presence => true
  validates :idea_id, :presence => true
end
