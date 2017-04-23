class ActivitiesController < ApplicationController
  respond_to :html, :js, :json
  #Don't know if need
  # def new_activity
  #   @activity = Activity.new
  # end

  def create_activity
    @activity = Activity.create(activity_params)
    @activity.user_id = current_user.id
    @activities = Activity.all
      if @activity.save
        flash[:success] = 'Activity created successfully'
        respond_to do |format|
          format.js {render 'activity_ajax.js.erb'}
        end
      else
       flash[:notice] ='ERROR: Activity could not be create'
      end
  end

  def edit_activity
    @activity = Activity.find(params[:id])
    
  end

  def update_activity
    @activities = Activity.all
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activity_params)
      flash[:success] = 'Activity updated successfully!'
      respond_to do |format|
        format.js {render 'activity_ajax.js.erb'}
      end
    else
      flash[:notice] = 'Activity was not updated'
      render 'home/home'
    end
  end

  def destroy_activity
    @activity = Activity.find(params[:id])
    @activity.destroy
  end

  def hide_activity
    @activity = Activity.find(params[:id])
    @activity.update_attribute(:hidden, true)
    if @activity.save
      flash[:success] = 'Activity hidden successfully!'
    end

  end

  # This unhides activities that are not in categories
  def unhide_activity
    @activities = Activity.where(:category_id => nil)
    @activities.update_all(hidden: false)
    respond_to do |format|
      format.js {render 'activity_ajax.js.erb'}
    end
  end

  def increase_total_time
    @activity = Activity.find(params[:id])
    @activity.increment!(:total_time,15)
  end

  def decrease_total_time
    @activity = Activity.find(params[:id])
    @activity.decrement!(:total_time,15)
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
