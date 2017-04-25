class UsersController < ApplicationController

  #This function instantiates a user object so form_for can function properly
  def new
    @user = User.new
  end

  #The create function which creates a user account based on the user's input
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Account created'
      redirect_to home_path
    else
      render 'users/new'
    end
  end


  private
  #The user params that are allowed and required in order ot successfully create a user account
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
