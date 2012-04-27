class ApplicationController < ActionController::Base

  protect_from_forgery  
  before_filter :set_metadata
  before_filter :get_projects
  
  private
  
  def set_metadata
    @metadata ||= {}
  end
  
  def get_projects
    @projects = Project.all
  end
end
