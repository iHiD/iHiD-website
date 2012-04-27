class Admin::SessionsController < AdminController  
  
  skip_before_filter :check_permissions

  def new
  end
  
  def create
    if params[:password] && Digest::SHA1::hexdigest(params[:password]) == "ca7fad2392194e8473d5e3195e0b332a9cd37423"
      session[:is_admin] = true
      redirect_to (session[:return_to] || admin_blog_posts_path)
    else
      render action: :new
    end
  end
  
end
