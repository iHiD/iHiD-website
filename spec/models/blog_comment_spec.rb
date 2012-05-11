require 'spec_helper'

describe BlogComment do
  it "should get gravatar url" do
    comment = BlogComment.new(user_email: "jez.walker@gmail.com")
    gravatar_id = Digest::MD5::hexdigest(comment.user_email).downcase
    comment.user_gravatar_url.should == "http://gravatar.com/avatar/#{gravatar_id}.png?s=50"
  end
  
  it "should have a scope for verified comments" do
    blog_post = BlogPost.create!(title:"My first post", content: "Some content")
    comment = blog_post.comments.create!(user_name: "Jeremy Walker", user_email: "jez.walker@gmail.com", content: "Hello")
    blog_post.comments.verified.count.should == 0
    
    comment.verified!
    blog_post.comments.verified.count.should == 1
  end
  
  it "should not allow verified to be mass-assigned" do
    lambda{BlogComment.new(verified: true)}.should raise_error ActiveModel::MassAssignmentSecurity::Error
  end
  
  it "should allow comments to be verified" do 
    blog_post = BlogPost.create!(title:"My first post", content: "Some content")
    comment = blog_post.comments.create!(user_name: "Jeremy Walker", user_email: "jez.walker@gmail.com", content: "Hello")
    comment.verified.should == false
    comment.verified!
    comment.verified.should == true
  end
end