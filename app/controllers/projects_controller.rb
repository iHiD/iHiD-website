class ProjectsController < ApplicationController

  def index
    redirect_to page_path('open_source')
  end

  def show
    @project = Project.find(params[:id])
    redirect_to @project.github_url
  end

end
