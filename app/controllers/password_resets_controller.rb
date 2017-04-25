class PasswordResetsController < ApplicationController

  #This is simply here so we can access the new.html.erb view for this controller
  def new
  end

  #This function finds the user with the given email parameter and then calls that particular
  #user's "deliver_password_reset_instructions" function so the user can reset their password
  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions
      flash[:success] = 'Instructions to reset your password have been emailed to you.'
      redirect_to home_path

    else
      flash[:warning] = 'No user was found with that email address'
      render :new

    end
  end

  #This allows the user to change their password once they click on the appropriate link from their email
  #It is only a perishable_token that will expire once used
  def edit
    @user = User.find_by(perishable_token: params[:id])
  end

  #This function updates the user's password once they have changed it by updating the attribute of the user
  def update
    @user = User.find_by(perishable_token: params[:id])
    if @user.update_attributes(password_reset_params)
      flash[:success] = 'Password successfully updated'
      redirect_to home_path

    else
      render :edit

    end

  end

  private

  #The params for the password_resets model
  def password_reset_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end

