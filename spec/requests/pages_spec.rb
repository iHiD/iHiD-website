require 'spec_helper'

describe "Pages" do
  describe "GET /" do
    it "correctly routes the home page" do
      visit "/"
      page.status_code.should be 200
      page.should have_selector("h1", :text => "iHiD")
    end
  end
  
  describe "GET page/:id" do
    it "redirects if there is no page" do
      visit page_path("foobar")
      page.should have_selector("h1", :text => "iHiD")
    end
    it "renders the correct page if there is a page" do
      Project.create!(name:"foobar", template: "foobar")
      lambda {visit page_path("foobar")}.should raise_error(ActionView::MissingTemplate, /Missing template pages\/foobar/)
    end
  end
end
