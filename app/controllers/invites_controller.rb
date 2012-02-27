class InvitesController < ApplicationController
  
  def create
  end
  
  def update
    @invite = Invite.find(params[:id])
    @invite.vote = "1"
#    @invite.save
#    puts "the invite was saved #{@invite}"
#    respond_to do |format|
#      format.html { redirect_to @invite.idea }
#      format.js
#    end
  end
end
