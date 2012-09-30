class AdminController < ApplicationController
  layout "admin"
  
  before_filter :check_permissions
  
  protected
  def check_permissions
    unless is_admin = session[:is_admin]
      session[:return_to] = request.path
      redirect_to new_admin_session_path
    end
    
    return is_admin
  end
end