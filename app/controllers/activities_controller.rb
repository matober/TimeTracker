class ActivitiesController < ApplicationController
  respond_to :html, :js

  #Don't know if need
  # def new_activity
  #   @activity = Activity.new
  # end

  def create_activity
    @activity = Activity.create(activity_params)
    @activity.user_id = current_user.id
      if @activity.save
        flash[:success] = 'Activity created successfully'
      else
       flash[:notice] ='ERROR: Activity could not be create'
      end
  end

  def edit_activity
    @activity = Activity.find(params[:id])
  end

  def update_activity
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activity_params)
      flash[:success] = 'Activity updated successfully!'
      redirect_to root_path
    else
      flash[:notice] = 'Activity was not updated'
    end
  end


  def destroy_activity
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to root_path
  end

  def hide_activity
    @activity = Activity.find(params[:id])
    @activity.update_attribute(:hidden, true)
    if @activity.save
      flash[:success] = 'Activity hidden successfully!'
    end
    #redirect_to root_path

  end

  # This unhides activities that are not in categories
  def unhide_activity
    @activities = Activity.where(:category_id => nil)
    @activities.update_all(hidden: false)
    redirect_to root_path #Not optimal, fix if possible
  end

  def increment
    Activity.update_counters(a_name, :total_time => 1)
  end

  def decrement
    Activity.update_counters(a_name, :total_time => -1)
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
