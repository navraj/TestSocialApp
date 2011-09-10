class WallPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :commenter_user, :class_name => 'User',
             :foreign_key => 'commenter_user_id'
end
