class BlogPostsController < ApplicationController
  
  def index
    @blog_posts = BlogPost.order("created_at desc")
  end
  
  def show
    @blog_post = BlogPost.find(params[:id])
  end
  
end
