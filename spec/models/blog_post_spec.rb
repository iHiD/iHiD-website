require 'spec_helper'

describe BlogPost do
  it "should correctly return is_published" do
    blog_post = BlogPost.new
    blog_post.is_published?.should be_false
    
    blog_post.published_at = DateTime.now
    blog_post.is_published?.should be_true
  end
  
  it "should publish when asked to" do
    BlogPost.destroy_all
    blog_post = BlogPost.create!(title: "Hello", content: "Content")
    blog_post.publish!
    blog_post.published_at.to_date.should == DateTime.now.to_date
  end
  
  it "should only return published posts when using the published scope" do
    BlogPost.destroy_all
    BlogPost.create!(title:"foobar1",content:"content", published_at: DateTime.now)
    BlogPost.create!(title:"foobar2",content:"content", published_at: DateTime.now)
    BlogPost.create!(title:"foobar3",content:"content")
    BlogPost.published.size.should == 2
  end
end