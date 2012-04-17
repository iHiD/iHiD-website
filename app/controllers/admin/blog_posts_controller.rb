class Admin::BlogPostsController < AdminController
  
  def index
    @blog_posts = BlogPost.all
  end
  
  def show
    @blog_post = BlogPost.find(params[:id])
  end
  
  def new
    @blog_post = BlogPost.new
  end
  
  def create
    @blog_post = BlogPost.new(params[:blog_post])
    if @blog_post.save
      redirect_to [:admin, @blog_post]
    else
      render action: 'new'
    end
  end
  
  def edit
    @blog_post = BlogPost.find(params[:id])
  end
  
  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update_attributes(params[:blog_post])
      redirect_to [:admin, @blog_post]
    else
      render action: 'new'
    end
  end
  
  def publish
    @blog_post = BlogPost.find(params[:id])
    @blog_post.publish!
    redirect_to [:admin, @blog_post]
  end

  def destroy
    #@blog_post = BlogPost.find(params[:id])
    #@blog_post.destroy
  end  
  
end
