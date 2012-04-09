class Project < ActiveRecord::Base
  extend FriendlyId
  
  attr_accessible :name
  friendly_id :name, use: :slugged
  
  validates :name, presence: true
end
