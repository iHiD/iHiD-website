class BlogComment < ActiveRecord::Base
  
  attr_accessible :user_name, :user_email, :content
  belongs_to :blog_post
  
  validates :user_name, presence:true
  validates :user_email, presence:true
  validates :content, presence:true
  
  scope :verified, where(verified:true)
  
  def user_gravatar_url
    gravatar_id = Digest::MD5::hexdigest(user_email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=50"
  end
  
  def verified!
    update_attribute(:verified, true)
  end
end
