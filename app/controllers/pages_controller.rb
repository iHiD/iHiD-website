class PagesController < ApplicationController
  
  def index
  end
  
  def show
    begin
      @page = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to pages_path
      return false
    end
    
    render template: "pages/#{@page.template}"
  end
end
