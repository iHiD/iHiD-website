class PagesController < ApplicationController
  
  def index
  end
  
  def show
    @page = Page.find(params[:id])    
    render template: "pages/#{@page.template}"
  end
  
  def sitemap
    @pages = Page.all
    @projects = Project.all
    @blog_posts = BlogPost.published
  end
end
