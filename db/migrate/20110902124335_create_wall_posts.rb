class CreateWallPosts < ActiveRecord::Migration
  def change
    create_table :wall_posts do |t|
      t.integer :user_id
      t.string :msg
      t.timestamps
    end
  end
end
