class HomeController < ApplicationController

  #This is the main function for the home. We simply want to give it the appropriate instance variables
  #so that it can access the correct entries from the database
  def home
    @activities = Activity.all #This returns a list of all activities
    @activity = Activity.new #The new function allows the form_for to function

    @categories = Category.all  #This returns a lit of all categories
    @category = Category.new #The new function allows the form_for categories to function
  end

  # Save sorted activities position
  def sort
    params[:order].each do |key, value|
      Activity.find(value[:id]).update_attribute(:priority, value[:position])
    end
    render :nothing => true
  end

end
