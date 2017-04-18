class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end

  def create

    @user_session = UserSession.new(user_session_params)
    @user_session.remember_me = true

    if @user_session.save
      flash[:success] = 'Welcome back'
      redirect_to :back
    else
      flash[:notice] = 'Failed to log in'
      redirect_to :back
    end
  end

  def destroy
    current_user_session.destroy
    flash[:success] = 'Goodbye'
    redirect_to :back
  end

  private

  def user_session_params
    #params.require(:user_session).permit(:email,:password,:remember_me)
    params.require(:user_session).permit(:email,:password)

  end

end
