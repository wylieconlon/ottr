class Idea < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :comments
  has_many :invites
  
  default_scope :order => 'ideas.created_at DESC'
end
