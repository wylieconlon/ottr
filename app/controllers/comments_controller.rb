class CommentsController < ApplicationController
  def create
    @attr = { :message => params[:comment][:message],
              :idea_id => params[:comment][:idea_id],
              :commenter_id => current_user}
    @idea = Idea.find(params[:comment][:idea_id])
    @comment = Comment.create(@attr)
    @comment.message = @attr[:message]
    @comment.idea_id = @attr[:idea_id]
    @comment.commenter_id = @attr[:commenter_id]
    puts "#{@comment.idea_id}-#{@comment.commenter_id}-#{@comment.message}"
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@idea, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @idea, :status => :created, :location => @idea }
      else
        format.html { redirect_to(@idea, :notice => 'Comment was Not created.') }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end
end
