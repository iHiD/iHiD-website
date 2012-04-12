class Project < ActiveRecord::Base
  extend FriendlyId
  
  attr_accessible :name, :descriptive_name, :description, :github_url, :template
  friendly_id :name, use: :slugged
  
  validates :name, presence: true
  validates :template, presence: true
end
