class Project < ActiveRecord::Base
  extend FriendlyId
  
  attr_accessible :name, :action
  friendly_id :name, use: :slugged
  
  validates :name, presence: true
  validates :action, presence: true
end
