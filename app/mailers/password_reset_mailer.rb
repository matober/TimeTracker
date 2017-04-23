class PasswordResetMailer < ApplicationMailer
  def reset_email(user)
    @user = user
    mail(to: @user.email, subject: 'Time Tracker Password reset instructions')
  end
end