class BlogCommentsController < ApplicationController
  
  def create
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.create!(params[:blog_comment])
    redirect_to @blog_post
    #respond_to do |format|
    #end
  end
  
end
