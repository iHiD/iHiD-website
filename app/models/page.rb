class Page < ActiveRecord::Base
  extend FriendlyId
  
  attr_accessible :name, :template
  friendly_id :name, use: :slugged
  
  validates :name, presence: true
  validates :template, presence: true
end
