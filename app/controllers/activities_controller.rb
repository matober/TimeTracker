class ActivitiesController < ApplicationController

  #This is here to make the code look cleaner
  #This makes it so every function responds to html, js, and/or json when prompted by "remote: true"
  respond_to :html, :js, :json

  #Method that creates an activity with the given params
  def create_activity
    @activity = Activity.create(activity_params)
    @activity.user_id = current_user.id #set the user id to the current user's id that is logged in

    @activities = Activity.all #This is here so the display render works as it requires an instance of all activities
    @categories = Category.all

    #If the activity is saved, run the ajax JS
    if @activity.save
        flash[:success] = 'Activity created successfully'

        #This makes it so the function loads a different JS as by default, it will look
        #for a JS file with the same name as the function
        respond_to do |format|
          format.js {render 'activity_ajax.js.erb'}
        end
    end
  end

  #This is mainly used to find the activity by its ID to edit
  def edit_activity
    @activity = Activity.find(params[:id])
  end

  #This function is where the actual updates to the activity happen
  def update_activity
    @categories = Category.all
    @activities = Activity.all #We need this so the display_activity render works properly
    @activity = Activity.find(params[:id]) #Finds the activity to edit using the ID

    #Checks to see if the activity updated successfully with the given parameters
    if @activity.update_attributes(activity_params)
      flash[:success] = 'Activity updated successfully!'

      #Similar to the create function, we want to render a different JS file and not the default one
      #The idea is to have less files as both this and the create function result in the rendering of the activities
      respond_to do |format|
        format.js {render 'activity_ajax.js.erb'}
      end
    end
  end

  #This function finds an activity by its ID and destroys/deletes it
  def destroy_activity
    @activity = Activity.find(params[:id])
    @activity.destroy
  end

  #This function finds an activity through its ID and sets the hidden field to true so the activity does not display
  def hide_activity
    @activity = Activity.find(params[:id])

    #This updates the field "hidden" as it is the only field we need to update
    @activity.update_attribute(:hidden, true)

    if @activity.save
      flash[:success] = 'Activity hidden successfully!'
    end

  end

  # This unhides activities that are not in categories
  def unhide_activity
    @categories = Category.all
    @activities = Activity.where(:category_id => nil)
    @activities.update_all(hidden: false)

    #Similar to the edit and create, we call a custom JS file with AJAX as all three functions will have to render
    #the activities after they are completed successfully
    respond_to do |format|
      format.js {render 'activity_ajax.js.erb'}
    end
  end

  def increase_total_time
    @activity = Activity.find(params[:id])
    @activity.increment!(:total_time,15)
    
    #Rerenders the page after a button is pressed
    respond_to do |format|
        format.js{render 'time_ajax.js.erb'}
    end
  end

  def decrease_total_time
    @activity = Activity.find(params[:id])
    @activity.decrement!(:total_time,15)
    
    #Rerenders the page after a button is pressed
    respond_to do |format|
        format.js{render 'time_ajax.js.erb'}
    end
  end

  private

    #The parameters that are required and allowed for an activity
    def activity_params
  	  params.require(:activity).permit(:a_name, :category_id)
  	end
end
