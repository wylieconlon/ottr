class CommentsController < ApplicationController
  def create
    puts "!@! ---------- comments.create"
              
    puts "Comments Current User #{current_user.inspect}"
    @idea = Idea.find(params[:comment][:idea_id])
    @comment = Comment.create(@attr)
    @comment.message = params[:comment][:message]
    @comment.idea_id = params[:comment][:idea_id]
    @comment.commenter_id = current_user.id
    puts "#{@comment.idea_id}-#{@comment.commenter_id}-#{@comment.message}"
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@idea) }
        format.xml  { render :xml => @idea, :status => :created, :location => @idea }
      else
        format.html { redirect_to(@idea, :notice => 'Comment was Not created.') }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end
end
