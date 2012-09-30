class ProjectsController < ApplicationController
  
  def index
    @metadata[:title] = "Projects"
  end
  
  def show
    @project = Project.find(params[:id])   
    @metadata[:title] = @project.name 
    render template: "projects/#{@project.template}", layout: "project"
  end
  
end
