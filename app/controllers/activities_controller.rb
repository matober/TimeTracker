class ActivitiesController < ApplicationController
   def index
      @activities = Activity.all
    end

    def show
      @activity = Activity.find(params[:id])
    end

    def new
      @activity = Activity.new
    end

    def create
      @activity = Activity.create(activity_params)
      if @activity = Activity.save
        flash[:success] = 'Activity created successfully!'
        redirect_to @activity
      else
        flash[:error] = 'ERROR: Activity was not saved!'
        render_to_string #normally would have it render to the name of view ex: :new
      end
    end

    def edit
      @activity = Activity.find(params[:id])
    end

    def update
      @activity = Activity.update(activity_params)
      if @activity.save
        flash[:success] = 'Activity successfully updated!'
        redirect_to @activity
      else
        flash[:error] = 'ERROR: Activity failed to update'
        render_to_string
      end
    end

    private
    def activity_params
      params.require(:activity).permit(:name)
    end

  end

