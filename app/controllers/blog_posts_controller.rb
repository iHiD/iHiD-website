class BlogPostsController < ApplicationController

  def index
    @blog_posts = BlogPost.published.order("published_at desc")
    @metadata[:title] = "Blog"
  end

  def show
    @blog_post = BlogPost.find(params[:id])
    @metadata[:title] = @blog_post.title
    raise ActiveRecord::RecordNotFound unless @blog_post.is_published?

    @metadata[:title] = "#{@blog_post.title} by Jeremy Walker"
  end

end
