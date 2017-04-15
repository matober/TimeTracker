class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      flash[:success] = 'Account created'
      redirect_to home_path
    else
      flash[:notice] ='ERROR: Account was not created'
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
