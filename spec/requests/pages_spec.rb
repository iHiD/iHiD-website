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
    it "renders the correct page if there is a page" do
      Page.create!(name: "somepage", template:"foobar")
      lambda {visit page_path("somepage")}.should raise_error(ActionView::MissingTemplate, /Missing template pages\/foobar/)
    end
  end
  
  describe "GET page/:id" do
    it "renders the correct page if there is a page" do
      %w{about speaking writing}.each do |name|
        Page.create!(name: name, template:name)
        visit page_path(name)
        page.status_code.should be 200
      end
    end
  end
end
