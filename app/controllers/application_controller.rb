class ApplicationController < ActionController::Base

  protect_from_forgery
  before_filter :check_uri
  before_filter :set_metadata
  before_filter :get_projects
  
  private

  def check_uri
    redirect_to "#{request.protocol}www.#{request.host_with_port}#{request.fullpath}" if !/^www/.match(request.host) if Rails.env.production?
    true
  end
  
  def set_metadata
    @metadata ||= {}
  end
  
  def get_projects
    @projects = Project.all
  end
end
