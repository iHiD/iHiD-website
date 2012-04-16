require 'spec_helper'

describe ApplicationHelper do
  describe "html_title" do
    it "should return webpage title by default" do
      helper.html_title.should == "iHiD - Jeremy Walker"
    end
  end
  
  describe "nl2br" do
    it "should convert new line to <br/>s" do
      helper.nl2br("foo\nbar").should == "foo<br/>bar"
    end
  end
end
