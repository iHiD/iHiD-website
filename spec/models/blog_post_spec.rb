require 'spec_helper'

describe BlogPost do
  it "should correctly return is_published" do
    blog_post = BlogPost.new
    blog_post.is_published?.should be_false
    
    blog_post.published_at = DateTime.now
    blog_post.is_published?.should be_true
  end
  
  it "should publish when asked to" do
    blog_post = BlogPost.create!(title: "Hello", content: "Content")
    blog_post.publish!
    blog_post.published_at.to_date.should == DateTime.now.to_date
  end
end