class BlogPost < ActiveRecord::Base
  extend FriendlyId
  
  attr_accessible :title, :content, :created_at
  friendly_id :title, use: :slugged
  
  has_many :comments, class_name: "BlogComment"
  
end
