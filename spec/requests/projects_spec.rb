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
    it "renders the correct page if there is a project" do
      defaults = {descriptive_name: "descriptive_name", description: "description", github_url: "github_url"}
      Project.create!(defaults.merge(name: "name", template:"foobar"))
      lambda {visit project_path("name")}.should raise_error(ActionView::MissingTemplate, /Missing template projects\/foobar/)
    end
  end
end
