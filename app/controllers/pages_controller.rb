class PagesController < ApplicationController

  def index
  end

  def about
    @metadata[:title] = "Jeremy Walker's Articles"
  end

  def about
    @metadata[:title] = "Jeremy Walker Speaking at Conferences"
  end

  def about
    @metadata[:title] = "About Jeremy Walker"
  end

  def open_source
    @metadata[:title] = "Jeremy Walker's Open Source Contributions"
  end

  def sitemap
    @pages = Page.all
    @projects = Project.all
    @blog_posts = BlogPost.published
  end
end
