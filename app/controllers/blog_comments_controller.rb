class BlogCommentsController < ApplicationController
  
  def create
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.create!(params[:blog_comment])
    
    respond_to do |format|
      format.html {redirect_to @blog_post}
      format.js {}
    end
  end
  
end
