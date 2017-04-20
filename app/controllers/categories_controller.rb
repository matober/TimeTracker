class CategoriesController < ApplicationController


  def new
    @category = Category.new
  end

  def create_category
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      flash[:success] = 'Category created successfully!'
    else
      flash[:error] = 'ERROR: Category was not saved!'
    end
  end

  def edit_category
    @category = Category.find(params[:id])
  end

  def update_category
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = 'Activity successfully updated!'
      redirect_to root_path
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
end
