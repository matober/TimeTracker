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
    @activity.priority = @activity.id

    @object = Category.all

    @activities = Activity.all
    @categories = Category.all

    if @activity.save
      flash[:success] = 'Activity created successfully'
    else
      flash[:notice] ='ERROR: Activity could not be create'
    end
  end

  def create_category
    @category = Category.new(category_params)
    @category.user_id = current_user.id


    #@category.priority = @category.id

    @object = Category.all
    @activities = Activity.all
    @categories = Category.all


    if @category.save!
      flash[:success] = 'Category created successfully!'
    else
      flash[:error] = 'ERROR: Category was not saved!'
    end
  end

  def destroy_activity
    @activity = Activity.find(params[:id])
    @activity.destroy

    @object = Category.all

    @activities = Activity.all
    @categories = Category.all
  end

  def welcome
  end


  def hide_activity

    @object = Category.all

    @activities = Activity.all
    @categories = Category.all

    @activity = Activity.find(params[:id])
    @activity.update_attribute(:hidden, true)
    respond_to do |format|
      format.html {redirect_to activities_url}
      format.js
    end
  end

  #NEW 4/15
  def edit_activity
    @activity = Activity.find(params[:id])
  end

  def update_activity
    @activity = Activity.find(params[:id])

    if @activity.update_attributes(activity_params)
      flash[:success] = 'Activity updated successfully!'
    else
      flash[:notice] = 'Activity was not updated'
    end
  end

  def unhide_all

    @object = Category.all

    @activities = Activity.all
    @categories = Category.all

    @activities = Activity.all
    @activities.update_all(hidden: false)
    # redirect_to root_path
  end

  def sort
    params[:order].each do |key, value|
      Activity.find(value[:id]).update_attribute(:priority, value[:position])
    end
    render :nothing => true
  end

  private

  def activity_params
    params.require(:activity).permit(:a_name, :category_id)
  end

  def category_params
    params.require(:category).permit(:c_name)
  end
end
