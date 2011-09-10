class UserSessionsController < ApplicationController
  before_filter :logged_in_user, :only => ['destroy']

  def new
    redirect_to wall_posts_url and return if current_user
    @user_session = UserSession.new
  end

  def create
    redirect_to wall_posts_url and return if current_user
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to wall_posts_url, :notice => "Successfully logged in."
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    redirect_to root_url, :notice => "Successfully logged out."
  end
end
