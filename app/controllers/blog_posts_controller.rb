class BlogPostsController < ApplicationController
  
  def index
    @blog_posts = BlogPost.published.order("published_at desc")
  end
  
  def show
    @blog_post = BlogPost.find(params[:id])
    raise ActiveRecord::RecordNotFound unless @blog_post.is_published?
    
    @metadata[:title] = @blog_post.title
  end
  
end
