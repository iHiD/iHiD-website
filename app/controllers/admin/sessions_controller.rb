class Admin::SessionsController < AdminController  
  
  skip_before_filter :check_permissions

  def new
  end
  
  def create
    if params[:password] && Digest::SHA2::hexdigest("#{ENV["IHID_WEBSITE_SALT"]}#{params[:password]}") == ENV["IHID_WEBSITE_HASH"]
      session[:is_admin] = true
      redirect_to (session[:return_to] || admin_blog_posts_path)
    else
      render action: :new
    end
  end
  
end
