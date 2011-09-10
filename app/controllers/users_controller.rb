class UsersController < ApplicationController
  before_filter :logged_in_user, :only => ['edit', 'update']
  
  def new
    redirect_to wall_posts_url and return if current_user
    @user = User.new
  end

  def create
    redirect_to wall_posts_url and return if current_user
    @user = User.new(params[:user])
    if @user.save
      redirect_to wall_posts_url, :notice => "Registration successful."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to wall_posts_url, :notice  => "Successfully updated profile."
    else
      render :action => 'edit'
    end
  end
end
