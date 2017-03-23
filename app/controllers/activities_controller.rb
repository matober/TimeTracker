class ActivitiesController < ApplicationController
  def JSloadMethod

  end

  def home
    @activities = Activity.all
    @categories = Category.all
    @activity = Activity.new
    @category = Category.new
  end

  def index
    @activities = Activity.all
    @activity = Activity.new #MODIFIED
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end
=begin
  def create
  	@activity = Activity.create(activity_params)
    if @activity.save!
      flash[:success] = "Activity created successfully!"
    else
      flash[:error] = "ERROR: Activity was not saved!"
    end
  end
=end
  def create #Modified all new
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save 
        format.html {flash[:notice] = 'Activity was successfully created!'
        redirect_to '/activities'
        }
        format.js {}
      else
        format.html { flash[:notice] ='ERROR: Activity could not be create'}
      end
    end
  end



  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.update(activity_params)
    if @activity.save
      flash[:success] = "Activity successfully updated!"
    else
      flash[:error] = "ERROR: Activity failed to update"
    end
  end

  def destroy

  end

  private
    def activity_params
  	  params.require(:activity).permit(:a_name)
  	end

end
