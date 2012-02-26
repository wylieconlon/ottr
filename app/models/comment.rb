class Comment < ActiveRecord::Base
  belongs_to :user, :foreign_key => :commenter_id
  belongs_to :idea, :foreign_key => :idea_id
  
  attr_accessible :messaage
  
  default_scope :order => 'comments.created_at DESC'
  
  validates :message, :presence => true, :length => { :maximum => 150 }
  validates :commenter_id, :presence => true
  validates :idea_id, :presence => true
end
