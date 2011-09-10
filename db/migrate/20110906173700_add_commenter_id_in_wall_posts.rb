class AddCommenterIdInWallPosts < ActiveRecord::Migration
  def change
    add_column :wall_posts, :commenter_user_id, :integer 
  end
end
