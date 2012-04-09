require 'spec_helper'

describe "Projects" do
  describe "GET /projects" do
    it "lists projects" do
      visit projects_path
      page.status_code.should be 200
      page.should have_selector("#projects")
    end
  end
  
  describe "GET project/:id" do
    it "redirects if there is no project" do
      visit project_path("foobar")
      page.should have_selector("h2", text:"My Projects")
    end
    it "renders the correct page if there is a project" do
      Project.create!(name:"foobar", action: "foobar")
      lambda {visit project_path("foobar")}.should raise_error(ActionView::MissingTemplate, /Missing template projects\/foobar/)
    end
  end
end
