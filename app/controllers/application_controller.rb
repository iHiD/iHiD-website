class ApplicationController < ActionController::Base

  protect_from_forgery  
  before_filter :get_projects
  
  private
  
  def get_projects
    @projects = Project.all
  end
end
