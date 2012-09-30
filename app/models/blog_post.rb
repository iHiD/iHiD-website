class BlogPost < ActiveRecord::Base
  extend FriendlyId
  
  attr_accessible :title, :content, :published_at
  friendly_id :title, use: [:slugged, :history]
  
  has_many :comments, class_name: "BlogComment", order: "id ASC"
  
  scope :published, where("published_at IS NOT NULL")
  
  def is_published?
    !!published_at
  end
  
  def publish!
    update_attribute(:published_at, DateTime.now)
  end
  
end
