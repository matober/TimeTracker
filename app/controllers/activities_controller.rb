class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:show, :edit, :update, :destroy]

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
  end

  def new
    @activity = Activity.new
  end

  def create
  	@activity = Activity.create(activity_params)
    if @activity.save!
      flash[:success] = "Activity created successfully!"
    else
      flash[:error] = "ERROR: Activity was not saved!"
    end
    redirect_to '/activities'
  end

  # def create #Modified all new
  #   @activity = Activity.new(activity_params)
  #
  #   respond_to do |format|
  #     if @activity.save
  #       format.html {flash[:notice] = 'Activity was successfully created!'
  #       redirect_to '/activities'
  #       }
  #       format.js {}
  #     else
  #       format.html { flash[:notice] ='ERROR: Activity could not be create'}
  #     end
  #   end
  # end



  def edit
    @activity = Activity.find(params[:id])
    @activity.update(:id)
  end

  def update
    @activity = Activity.update(:id => params[:id], :a_name => params[:a_name])

  end

  def destroy
    @activity.destroy
    redirect_to root_path
  end
=begin
  def delete
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to '/activities'
    flash[:alert] = "Task deleted!"
  end
=end

  def set_hidden_true
    @activity = Activity.find(params[:id])
    @activity.update_attribute(:hidden, true)
    if @activity.save!
      flash[:success] = "Activity hidden successfully!"
    end
    redirect_to root_path
  end


  private
    def activity_params
  	  params.require(:activity).permit(:a_name)
  	end

    def find_activity
      @activity = Activity.find(params[:id])
    end

  def update_params
    @activity = Activity.find(params[:id, :a_name])
  end
end
