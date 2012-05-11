class Admin::BlogCommentsController < AdminController
  
  def index
    @comments = BlogComment.order("verified ASC")
  end
  
  def verify
    @comment = BlogComment.find(params[:id])
    @comment.verify!
    respond_to do |format|
      format.js #
      format.html { redirect_to admin_blog_comments_path }
    end
  end

  def destroy
    @comment = BlogComment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js {}
      format.html { redirect_to admin_blog_comments_path }
    end
  end  
end
