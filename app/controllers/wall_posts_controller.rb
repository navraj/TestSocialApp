class WallPostsController < ApplicationController
  before_filter :logged_in_user
    
  def index
    @allow_delete = true
    @user = current_user
    @wall_posts = @user.wall_posts.includes(:commenter_user)
    @profile = @user.profile
  end

  def show
    redirect_to wall_posts_url and return if current_user.id == params[:id].to_i
    @user = User.find(params[:id])
    @profile = @user.profile
    @wall_posts = @user.wall_posts.includes(:commenter_user)
    @gray_user = current_user.is_gray_user?
    render :action => 'index'  
  end

  def create
    user = User.find(params[:user_id])
    @wall_post = user.wall_posts.build(params[:wall_post])
    if !current_user.is_gray_user? || current_user.id == user.id
      @wall_post.commenter_user_id = current_user.id
      if @wall_post.save
        respond_to do |format|
          format.html { redirect_to wall_post_url(user.id), notice: 'Wall post was successfully created.' }
          format.js {render :layout => false }
        end
      end
    end
  end

  def destroy
    @wall_post = WallPost.find(params[:id])
    if @wall_post.user_id == current_user.id || @wall_post.commenter_user_id == current_user.id
      if @wall_post.destroy
        respond_to do |format|
          format.html { redirect_to wall_post_path(@wall_post.user_id) }
          format.js {render :layout => false }
        end
      end
    end
  end 
end
