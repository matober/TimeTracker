class HomeController < ApplicationController
  def new

  end

  def index
    
  end

  #Unsure if this is needed but kept just in case
  def display_activities
    @activities = Activity.all
  end

end
