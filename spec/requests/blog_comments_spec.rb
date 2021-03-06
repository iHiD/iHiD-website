require 'spec_helper'

describe "Blog Comments" do
  describe "GET /" do
    before :each do
      @blog_post = BlogPost.create!(title:"My first post", content: "Some content")
      @blog_post.publish!
    end
    it "has div for no comments" do
      visit blog_post_path(@blog_post)
      page.should have_selector(".no_comments")
      page.should_not have_selector(".comment")
    end
    
    it "should not show unverified comments" do
      @blog_post.comments.create!(user_name: "Jeremy Walker", user_email: "jez.walker@gmail.com", content: "Hello")
      visit blog_post_path(@blog_post)
      page.should_not have_selector(".comment")
    end
    
    it "should show verified comment if present" do
      comment = @blog_post.comments.create!(user_name: "Jeremy Walker", user_email: "jez.walker@gmail.com", content: "Hello")
      comment.verify!
      visit blog_post_path(@blog_post)
      page.should have_selector(".comment")
    end
    
    it "has a new comment form" do
      visit blog_post_path(@blog_post)
      page.should have_selector("form", class: "new_blog_comment")
    end
    
    it "should create a comment and show an awaiting verification message" do
      visit blog_post_path(@blog_post)
      page.should_not have_selector(".comment")
      page.should have_selector(".no_comments")
      page.should have_selector(".new_blog_comment")
      
      fill_in 'blog_comment_user_name', :with => 'Jeremy Walker'
      fill_in 'blog_comment_user_email', :with => 'jez.walker@gmail.com'
      fill_in 'blog_comment_content', :with => 'This is my comment'
      click_button 'Post Comment'
      page.should have_selector(".awaiting_verification")
      page.should_not have_selector(".comment")
    end
    
    it "should create a comment and show it with Ajax", js: true do
      visit blog_post_path(@blog_post)
      page.should_not have_selector(".comment")
      page.should have_selector(".no_comments")
      page.should have_selector(".new_blog_comment")
      
      fill_in 'blog_comment_user_name', :with => 'Jeremy Walker'
      fill_in 'blog_comment_user_email', :with => 'jez.walker@gmail.com'
      fill_in 'blog_comment_content', :with => 'This is my comment'
      click_button 'Post Comment'
      
      page.should have_selector(".awaiting_verification")
      page.should_not have_selector(".no_comments")
      page.should_not have_selector(".new_blog_comment")
    end
  end
end
