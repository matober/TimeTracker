class ActivitiesController < ApplicationController
<<<<<<< HEAD
  def display
    @activities = Activity.all
=======
  def home
    @activities = Activity.all
    @categories = Category.all
    @activity = Activity.new
    @category = Category.new
>>>>>>> cd84a5d73a4862dec852b95d742ee0061a298f2f
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
<<<<<<< HEAD
  	@activity = Activity.new(activity_params)
    if @activity.save
      flash[:success] = 'Activity created successfully!'
      redirect_to activities_display_path
    else
      flash[:error] = 'ERROR: Activity was not saved!'
      #render_to_string #normally would have it render to the name of view ex: :new
=======
  	@activity = Activity.create(activity_params)
    if @activity.save!
      flash[:success] = "Activity created successfully!"
    else
      flash[:error] = "ERROR: Activity was not saved!"
>>>>>>> cd84a5d73a4862dec852b95d742ee0061a298f2f
    end
  end
=end
  def create #Modified all new
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save 
        format.html {flash[:notice] ='Activity was successfully created!'
        redirect_to @activity }
        format.js {}
        format.json { render json: @activity, status:
          :created, location: @activity }
      else
        format.html { render action: "new"}
        format.json { render json: @activity.errors,
         status: :unprocessable_entity}
      end
    end
  end



  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.update(activity_params)
    if @activity.save
<<<<<<< HEAD
      flash[:success] = 'Activity successfully updated!'
      redirect_to @section
    else
      flash[:error] = 'ERROR: Activity failed to update'
      render_to_string
=======
      flash[:success] = "Activity successfully updated!"
    else
      flash[:error] = "ERROR: Activity failed to update"
>>>>>>> cd84a5d73a4862dec852b95d742ee0061a298f2f
    end
  end

  def increment
    Activity.update_counters(a_name, :total_time => 1)
  end

  def decrement
    Activity.update_counters(a_name, :total_time => -1)
  end

  private
    def activity_params
  	  params.require(:activity).permit(:a_name)
  	end

end
