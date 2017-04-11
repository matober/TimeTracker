class HomeController < ApplicationController
  def new
    @activities = Activity.all

  end

  def index
    
  end

  def display_activities
    @activities = Activity.all
  end
end
