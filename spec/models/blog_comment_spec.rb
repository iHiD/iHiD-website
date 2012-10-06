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
    
    comment.verify!
    blog_post.comments.verified.count.should == 1
  end
  
  it "should not allow verified to be mass-assigned" do
    lambda{BlogComment.new(verified: true)}.should raise_error ActiveModel::MassAssignmentSecurity::Error
  end
  
  it "should allow comments to be verified" do 
    blog_post = BlogPost.create!(title:"My first post", content: "Some content")
    comment = blog_post.comments.create!(user_name: "Jeremy Walker", user_email: "jez.walker@gmail.com", content: "Hello")
    comment.verified.should == false
    comment.verify!
    comment.verified.should == true
  end
  
  it "should check whether things are probably spam" do
    blog_post = BlogPost.create!(title:"My first post", content: "Some content")
    blog_post.comments.create!(user_name: "Jeremy Walker", user_email: "jez.walker@gmail.com", content: "Hello").probably_spam?.should be_false
    comment = blog_post.comments.build(user_name: "viagra-test-123", user_email: "viagra-test-123", content: "viagra-test-123")
    comment.stub user_ip: "127.0.0.1"
    comment.stub user_agent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.79 Safari/537.4"
    comment.stub referrer: "http://www.ihid.co.uk/blog/a-scope-for-returning-no-records-in-activerecord"
    comment.stub permalink: "http://www.ihid.co.uk/blog/a-scope-for-returning-no-records-in-activerecord"
    comment.save!
    comment.probably_spam?.should be_true
  end
end