class ActivitiesController < ApplicationController
  respond_to :html, :js

  def display
    @activities = Activity.all
    @activity = Activity.new
    @category = Category.new
    @categories = Category.all
  end

  def index
    @activities = Activity.all
    @activity = Activity.new

  end

  def show
    @activities = Activity.all
    @activity = Activity.new

    respond_to do |format|
      format.html
      format.json
    end
  end

    def all_activities
      @activities = Activity.all
    end

  def new
    @activity = Activity.new
    @activities = Activity.all
  end

  def create #Modified all new
    @activity = Activity.create(activity_params)
    @activities = Activity.all
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.update(activity_params)
    if @activity.save
      flash[:success] = 'Activity successfully updated!'
      redirect_to root
    else
      flash[:error] = 'ERROR: Activity failed to update'
      render_to_string
    end
  end

  private
    def activity_params
  	  params.require(:activity).permit(:a_name)
  	end

end
