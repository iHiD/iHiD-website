require 'spec_helper'

describe "Pages" do
  describe "GET /" do
    it "correctly routes the home page" do
      visit "/"
      page.status_code.should be 200
      page.should have_selector("h1", :text => "iHiD")
    end
  end
end
