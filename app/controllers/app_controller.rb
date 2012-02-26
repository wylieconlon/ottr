class AppController < ApplicationController
  def index
    @ideas = Idea.all
  end
  
  def new
  end
end