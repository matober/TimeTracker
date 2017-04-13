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
      if @activity.save
        flash[:success] = 'Activity created successfully'
      else
       flash[:notice] ='ERROR: Activity could not be create'
      end
    end
  end



  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update_attributes(:a_name)
    # if @activity.update_attributes(params[:a_name])
    #   redirect_to root_path, :notice => "Your activity has successfully been updated!"
    # else
    #   redirect_to root_path, :notice => "Not updated :("
    # end
    respond_to do |format|
      format.js {}
    end
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
  end

  def unhide_all
    @activities = Activity.all
    @activities.update_all(hidden: false)
    # redirect_to root_path
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


end
