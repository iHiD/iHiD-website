require 'spec_helper'

describe BlogPostsController do
  it "should only list published posts" do
    BlogPost.destroy_all
    BlogPost.create!(title:"foobar1",content:"content", published_at: DateTime.now)
    BlogPost.create!(title:"foobar2",content:"content", published_at: DateTime.now)
    BlogPost.create!(title:"foobar3",content:"content")
    
    get :index
    assigns(:blog_posts).size.should == 2
  end
  
  it "should only show published posts" do
    blog_post = BlogPost.create!(title:"Testing published", content: "Some Content")
    lambda {get :show, id: blog_post.id}.should raise_error ActiveRecord::RecordNotFound
    
    blog_post.publish!
    lambda {get :show, id: blog_post.id}.should_not raise_error
  end
  
  it "should correctly set the page's title" do
    title = "Testing Title Set"
    blog_post = BlogPost.create!(title:title, content: "Some Content")
    blog_post.publish!
    get :show, id: blog_post.id
    
    assigns[:metadata][:title].should == "#{title} by Jeremy Walker"
  end
end