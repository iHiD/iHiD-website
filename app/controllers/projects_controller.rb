class ProjectsController < ApplicationController
  
  def index
  end
  
  def show
    @project = Project.find(params[:id])    
    render template: "projects/#{@project.template}", layout: "project"
  end
  
end
