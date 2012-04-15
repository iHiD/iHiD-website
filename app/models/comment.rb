class Comment < ActiveRecord::Base
  
  attr_accessible :user_name, :user_email, :content
  belongs_to :blog_post
  
end
