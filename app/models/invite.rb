class Invite < ActiveRecord::Base
  attr_accessible :email # actually the phone number
  belongs_to :idea
  
end
