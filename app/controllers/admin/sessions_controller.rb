class Admin::SessionsController < AdminController  
  
  skip_before_filter :check_permissions

  def new
  end
  
  def create
    if params[:password] && Digest::SHA1::hexdigest(params[:password]) == "302f45183f4c13ddd3334b48c7f48e2ee66e0ac6"
      session[:is_admin] = true
      redirect_to (session[:return_to] || admin_blog_posts_path)
    else
      render action: :new
    end
  end
  
end
