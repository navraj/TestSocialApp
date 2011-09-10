class User < ActiveRecord::Base
  has_one :profile
  has_many :wall_posts
  

  HUMANIZED_ATTRIBUTES = {
    :fname => 'First name',
    :lname => 'Last name',
  }


  validates :country, 
            :inclusion => {
              :in => %w(USA Canada), 
              :message => "%{value} is not a valid country selection"
            }
             
  validates :fname, 
            :presence => true, 
            :length => { :maximum => 50 }

  validates :lname, :presence => true, :length => { :maximum => 50 }

  validates :town, :presence => true
  
  acts_as_authentic do |config|
    config.login_field = :email
  end
  

  attr_accessible :fname, :lname, :account_type, :country, :town, :email, :password, :password_confirmation

  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  def is_gray_user?
    return false if self.account_type
    return true  
  end
end
