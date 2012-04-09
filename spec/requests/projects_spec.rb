require 'spec_helper'

describe "Projects" do
  describe "GET /projects" do
    it "lists projects" do
      visit projects_path
      page.status_code.should be 200
      page.should have_selector("#projects")
    end
  end
end
