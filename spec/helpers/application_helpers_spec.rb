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
  
  describe "nl2p" do
    it "should convert new line to <br/>s" do
      helper.nl2p("foo\nbar").should == "<p>foo<br/>bar</p>"
    end
    it "should convert double new line to <p/>s" do
      helper.nl2p("foo\n\nbar").should == "<p>foo</p><p>bar</p>"
    end
  end
  
  describe "my_age_in_years" do
    it "should return 28" do
      helper.my_age_in_years.should == 28
    end
  end
end
