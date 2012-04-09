class ProjectsController < ApplicationController
  
  def index
  end
  
  def show

    begin
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to projects_path
      return false
    end
    
    render template: "projects/#{@project.action}"
    #@project
  end
  
end
