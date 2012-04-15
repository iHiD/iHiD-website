class PagesController < ApplicationController
  
  def index
  end
  
  def show
    @page = Page.find(params[:id])    
    render template: "pages/#{@page.template}"
  end
end
