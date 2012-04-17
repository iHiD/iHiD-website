class AdminController < ApplicationController
  layout "admin"
  
  before_filter :check_permissions
  
  protected
  def check_permissions
    unless session[:is_admin]
      session[:return_to] = request.path
      redirect_to new_admin_session_path
      return false
    end
    
    return true
  end
end