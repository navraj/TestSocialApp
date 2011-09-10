class Profile < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :photo, 
                    :styles => { :thumb_nail => '100x100>', :large => '300x200>' },
                    :url => "/assets/profiles/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/profiles/:id/:style/:basename.:extension"
  
  validates_attachment_size :photo, :less_than => 2.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/gif', 'image/png']
  attr_accessible :tag_line, :description, :photo
end
