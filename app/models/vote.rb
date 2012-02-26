class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  
  attr_accessible :vote
  # vote = '0' No Vote, or Not Participating
  # vote = '1' Yes Vote
end
