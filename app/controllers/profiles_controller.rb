class ProfilesController < ApplicationController
  before_filter :logged_in_user, :only => ['new', 'create', 'edit', 'update'] 
  

  def new
    redirect_to edit_user_url(:current_user) and return if current_user.profile
    @profile = Profile.new 
  end

  def create
    @profile = current_user.build_profile(params[:profile])
    if @profile.save
      redirect_to root_url, :notice => "Profile successfully created."
    else
      render :action => 'new'
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(params[:profile])
      redirect_to wall_posts_url, :notice  => "Profile successfully updated."
    else
      render :action => 'edit'
    end
  end
end
