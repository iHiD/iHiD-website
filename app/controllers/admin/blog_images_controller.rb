class Admin::BlogImagesController < AdminController
  
  def index
    @blog_images = BlogImage.all
  end
  
  def new
    @blog_image = BlogImage.new
  end
  
  def create
    @blog_image = BlogImage.new(params[:blog_image])
    @blog_image.save!
  end
  
end
