class BlogCommentsController < ApplicationController
  
  def create
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.create!(params[:blog_comment])
    
    respond_to do |format|
      format.html do 
        flash[:awaiting_verification] = true
        redirect_to @blog_post
      end
      format.js {}
    end
  end
  
end
