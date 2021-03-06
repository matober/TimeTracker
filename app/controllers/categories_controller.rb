class CategoriesController < ApplicationController
  respond_to :html, :js, :json
  #Function that creates the category with the given parameters
  def create_category
    @category = Category.new(category_params)
    @category.user_id = current_user.id #
    @categories = Category.all

    @activity = Activity.new

    if @category.save
      flash[:success] = 'Category created successfully!'
      respond_to do |format|
        format.js {render 'category_ajax.js.erb'}
      end
    else
      flash[:error] = 'ERROR: Category was not saved!'
    end
  end

  def edit_category
    @category = Category.find(params[:id])
  end

  def update_category
    @categories = Category.all
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = 'Activity successfully updated!'
      respond_to do |format|
        format.js {render 'category_ajax.js.erb'}
      end
    else
      flash[:error] = 'ERROR: Activity failed to update'
    end

  end

  def unhide_cat_activities
    @category = Category.find(params[:id])
    @activities = Activity.where(:category_id => @category.id)
    @activities.update_all(hidden: false)
    redirect_to root_path
  end

  def destroy_category
    @category = Category.find(params[:id])
    @category.destroy
    #redirect_to root_path

  end


  private
  def category_params
    params.require(:category).permit(:c_name)
  end

  #The parameters that are required and allowed for an activity
  def activity_params
    params.require(:activity).permit(:a_name, :category_id)
  end
end
