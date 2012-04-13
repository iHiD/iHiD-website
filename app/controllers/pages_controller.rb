class PagesController < ApplicationController
  
  def index
  end
  
  def show
    @page = Project.find(params[:id])    
    render template: "pages/#{@page.template}"
  end
end
