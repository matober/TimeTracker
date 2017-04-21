class HomeController < ApplicationController

  def home
    @activities = Activity.all
    @activity = Activity.new

    @categories = Category.all
    @category = Category.new
  end

  def sort
    params[:order].each do |key, value|
      Activity.find(value[:id]).update_attribute(:priority, value[:position])
    end
    render :nothing => true
  end

end
