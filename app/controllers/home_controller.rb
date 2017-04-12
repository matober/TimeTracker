class HomeController < ApplicationController
  respond_to :html, :js


  def new

  end

  def index
    
  end

  def home
    @activities = Activity.all
    @activity = Activity.new

    @categories = Category.all
    @category = Category.new
  end

  def create_activity
    @activity = Activity.create(activity_params)
    @activity.user_id = current_user.id
    #@activities = Activity.all
    #@categories = Category.all

    if @activity.save
      flash[:success] = 'Activity created successfully'
    else
      flash[:notice] ='ERROR: Activity could not be create'
    end
  end

  def create_category
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save!
      flash[:success] = 'Category created successfully!'
    else
      flash[:error] = 'ERROR: Category was not saved!'
    end
  end

  def welcome
  end

  #Unsure if this is needed but kept just in case
  def display_activities
    @activities = Activity.all
  end

  private

  def activity_params
    params.require(:activity).permit(:a_name, :category_id)
  end

  def category_params
    params.require(:category).permit(:c_name)
  end
end
