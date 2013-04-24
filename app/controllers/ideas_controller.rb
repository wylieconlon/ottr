class IdeasController < ApplicationController
  require "twilio-ruby"

  # Sandbox phone number
  # or outgoing Caller ID you have purchased through Twilio
  CALLER_ID = "+16172493708"

  #CALLER_PIN only needed to send using sandbox number. Looks like 9999-9999
  CALLER_PIN = "6498-6026"
  
  before_filter :authenticate, :only => [:index, :create, :destroy]
  
  # GET /ideas
  # GET /ideas.xml
  def index
    puts current_user.nil?
    if !signed_in?
      redirect_to root_path
    end
    
    @ideas = User.find(current_user).ideas
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.xml
  def show
    begin
      @idea = Idea.find(params[:id])
      
      puts "-- Show.init #{current_user.inspect}"
      
      puts "Nil: blah #{@idea.nil?}"
      @comment = Comment.new
      
      puts "#{@idea.inspect}"
      puts "#{@idea.comments.inspect}"
      puts "stuff"
      if @idea.comments.empty?
          @comments = []
      else
        @comments = @idea.comments
      end  
      
      
      #@count = count(@idea)
      
      puts "Comments Introspect #{@comments.inspect}"
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @idea }
      end

    rescue Exception => exc
      puts "--- Needed Rescuing #{exc.message}"
      redirect_to root_path
    end
    
  end

  # GET /ideas/new
  # GET /ideas/new.xml
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.xml
  def create
    @attr = params[:idea]
    puts "----- idea.create #{current_user.inspect}"
    @attr[:organizer] = current_user 
    
    guest_emails = params[:email]
    if (guest_emails.nil?)
      arr_emails = []
    else
      arr_emails = guest_emails.split(",")
    end
    
    @idea = current_user.ideas.build(@attr)
    @idea.users << current_user
    
    arr_emails.each do |email|
      puts "building invite #{email}"
      invitee = Invite.new
      invitee.email = email
      puts "Phone #{email}"
      @idea.invites << invitee
    end
    
    host = request.host
    
    if (host =~ /localhost/i)
      host = request.host_with_port
    end
    
    respond_to do |format|
      if @idea.save
        @idea.invites.each do |invite|
          twilio(invite.email, @idea.id, host)
        end
        
        format.html { redirect_to(root_path, :notice => 'Idea was successfully created.') }
        format.xml  { render :xml => @idea, :status => :created, :location => @idea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.xml
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to(@idea, :notice => 'Idea was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.xml
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to(ideas_url) }
      format.xml  { head :ok }
    end
  end
  
  private 
  
  def authenticate
    puts "-------Authenticating --- #{current_user.inspect}"
    redirect_to root_path unless signed_in?
  end
  
  def twilio(number, id, host)
    # your Twilio authentication credentials
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    name = current_user.email
    
    url = "www.ottr.co/ideas/#{id}"
    
    # send an sms
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    
    @client.account.sms.messages.create(
      :from => CALLER_ID,
      :to => number,
      :body => "Hey, #{name} floated an idea to you on Ottr! Visit #{url}"
    )
  end
  
  def count(idea)
    invites = idea.invites
    count = 0;
      
    invites.each do |invite|
      puts invite
      if (invite.vote)
        count += 1
      end
      
      if signed_in?      
        if (invite.email == current_user.email)
          @invite = invite
        end
      end
    end
    
    count
  end
end
