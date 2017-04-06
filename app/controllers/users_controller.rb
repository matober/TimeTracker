class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save
    redirect_to home_new_path
  end

  def show
    @user = User.find(params[:id])
  end
end
