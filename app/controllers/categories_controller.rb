class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @activities = @category.activities
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save!
      flash[:success] = 'Category created successfully!'
    else
      flash[:error] = 'ERROR: Category was not saved!'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.update(category_params)
    if @categories.save
      flash[:success] = 'Activity successfully updated!'
    else
      flash[:error] = 'ERROR: Activity failed to update'
    end
  end

  private
  def category_params
    params.require(:category).permit(:c_name)
  end
end
