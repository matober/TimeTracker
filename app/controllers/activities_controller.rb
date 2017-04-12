class ActivitiesController < ApplicationController
  respond_to :html, :js
  def home
    @activities = Activity.all
    @categories = Category.all
    @activity = Activity.new
    @category = Category.new


  end

  def index
    @activities = Activity.all
    @activity = Activity.new
  end

  def show
    @activity = Activity.find(params[:id])

  end

  def new
    @activity = Activity.new
  end

  def create #Modified all new
    @activity = Activity.create(activity_params)
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
    if @category.save!
      flash[:success] = 'Category created successfully!'
    else
      flash[:error] = 'ERROR: Category was not saved!'
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activities = Activity.update(:id => params[:id], :a_name => params[:a_name])
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to root_path
  end

  def set_hidden_true
    @activity = Activity.find(params[:id])
    @activity.update_attribute(:hidden, true)
    if @activity.save!
      flash[:success] = 'Activity hidden successfully!'
    end
    redirect_to root_path
  end

  private
    def activity_params
  	  params.require(:activity).permit(:a_name, :category_id)
  	end

  def find_activity
    @activity = Activity.find(params[:id])
  end

  def update_params
    @activity = Activity.find(params[:id, :a_name])
  end

  def category_params
    params.require(:category).permit(:c_name)
  end
end
