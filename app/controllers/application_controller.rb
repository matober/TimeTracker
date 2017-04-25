require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  private

  #This is the main function that allows a user to login and is used to find out if a user is logged in or not
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  #This is the function that allows us to identify who is currently logged in
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  helper_method :current_user_session, :current_user

  protected

  def handle_unverified_request
    # raise an exception
    fail ActionController::InvalidAuthenticityToken
    # or destroy session, redirect
    if current_user_session
      current_user_session.destroy
    end
    redirect_to root_url
  end

end
