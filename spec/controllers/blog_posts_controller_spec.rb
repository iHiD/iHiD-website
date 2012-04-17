require 'spec_helper'

describe BlogPostsController do
  it "should only show published posts" do
    blog_post = BlogPost.create!(title:"Testing published", content: "Some Content")
    lambda {get :show, id: blog_post.id}.should raise_error ActiveRecord::RecordNotFound
    
    blog_post.publish!
    lambda {get :show, id: blog_post.id}.should_not raise_error
  end
end