class PagesController < ApplicationController
  
  def index
    @metadata[:title] = "Pages"
  end
  
  def show
    @page = Page.find(params[:id])
    @metadata[:title] = @page.name
    render template: "pages/#{@page.template}"
  end
  
  def sitemap
    @pages = Page.all
    @projects = Project.all
    @blog_posts = BlogPost.published
  end
end
