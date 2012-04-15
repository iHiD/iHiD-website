class BlogComment < ActiveRecord::Base
  
  attr_accessible :user_name, :user_email, :content
  belongs_to :blog_post
  
  validates :user_name, presence:true
  validates :user_email, presence:true
  validates :content, presence:true
  
end
