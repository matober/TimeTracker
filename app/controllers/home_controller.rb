class HomeController < ApplicationController

  def home
    @activities = Activity.all
    @activity = Activity.new

    @categories = Category.all
    @category = Category.new
  end

end
