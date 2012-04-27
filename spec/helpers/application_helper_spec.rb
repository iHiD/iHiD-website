require 'spec_helper'

describe ApplicationHelper do
  describe "html_title" do
    it "should return webpage title by default" do
      helper.html_title.should == "iHiD - Jeremy Walker"
    end
    it "should return metadata title if present" do
      @metadata = {title: "foobar"}
      helper.html_title.should == "foobar - iHiD - Jeremy Walker"
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
  
  describe "latest_blog_posts" do
    it "should return latest 5 blog posts" do 
      BlogPost.destroy_all
      datetime = Time.now.utc
      10.times{|x|BlogPost.create(title:"foobar#{x}",content:"content#{x}", published_at: datetime - x.days)}
      posts = helper.latest_blog_posts
      posts.size.should == 5
      posts[0].published_at.to_date.should == datetime.to_date
      posts[4].published_at.to_date.should == datetime.to_date - 4.days
    end
    it "should only return published posts" do 
      BlogPost.destroy_all
      BlogPost.create!(title:"foobar1",content:"content", published_at: DateTime.now)
      BlogPost.create!(title:"foobar2",content:"content", published_at: DateTime.now)
      BlogPost.create!(title:"foobar3",content:"content")
      posts = helper.latest_blog_posts
      posts.size.should == 2
    end
  end
end
