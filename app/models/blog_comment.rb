class BlogComment < ActiveRecord::Base
  
  include Rakismet::Model
  
  attr_accessor :request
  
  attr_accessible :user_name, :user_email, :content, :request
  belongs_to :blog_post
  
  validates :user_name, presence:true
  validates :user_email, presence:true
  validates :content, presence:true
  
  scope :verified, where(verified:true)
  scope :unverified, where(verified:false)
  
  rakismet_attrs author: :user_name, author_email: :user_email
  
  before_create do
    self.probably_spam = false #spam?
    true
  end
  
  def user_gravatar_url
    gravatar_id = Digest::MD5::hexdigest(user_email.strip.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=50"
  end
  
  def verify!
    update_attribute(:verified, true)
  end
end
