class BlogPost < ActiveRecord::Base
  extend FriendlyId
  
  attr_accessible :title, :content
  friendly_id :title, use: :slugged
  
end
