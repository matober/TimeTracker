class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save!
      flash[:success] = 'Activity created successfully!'
      redirect_to activities_display_path
    else
      flash[:error] = 'ERROR: Activity was not saved!'
      #render_to_string #normally would have it render to the name of view ex: :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.update(category_params)
    if @categories.save
      flash[:success] = 'Activity successfully updated!'
      redirect_to root
    else
      flash[:error] = 'ERROR: Activity failed to update'
      render_to_string
    end
  end

  private
  def category_params
    params.require(:category).permit(:c_name)
  end
end
