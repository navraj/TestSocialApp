class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :logged_in_user

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    
    def logged_in_user
      redirect_to root_url and return unless current_user
    end
end
