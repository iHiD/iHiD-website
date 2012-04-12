require 'spec_helper'

describe ApplicationHelper do
  describe "html_title" do
    it "should return webpage title by default" do
      helper.html_title.should == "iHiD - Jeremy Walker"
    end
  end
end
