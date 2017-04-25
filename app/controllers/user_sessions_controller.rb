class UserSessionsController < ApplicationController

  #This function creates a new user session that essentially  allows the form_for to function and therefore
  # allow the user to enter their credentials and login
  def new
    @user_session = UserSession.new
  end

  #This creates a user_session with the user's entered credentials
  #If the credentials are entered incorrectly, they will not be logged in
  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save #If the parameters match and existing account, log the user in
      flash[:success] = 'Welcome back'
      redirect_to home_path
    else
      flash[:notice] = 'Failed to log in'
      render 'user_sessions/new' #Re-render the login page so we can display the errors
    end
  end

  #This function destroys the user session which mainly happens when the user signs out
  def destroy
    current_user_session.destroy
    flash[:success] = 'Goodbye'
    redirect_to :back
  end

  private

  #The user session parameters that are required and permitted in order to be able to create one successfully
  def user_session_params
    params.require(:user_session).permit(:email,:password)
  end

end
