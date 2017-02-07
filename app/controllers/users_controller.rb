class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Sign up complete!'
      flash[:color] = 'valid'
    else
      flash[:notice] = 'Sign up failed'
      flash[:color] = 'invalid'
    end
    render 'test'

  end
end
