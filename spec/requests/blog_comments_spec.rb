require 'spec_helper'

describe "Blog Comments" do
  describe "GET /" do
    before :each do
      @blog_post = BlogPost.create!(title:"My first post", content: "Some content")
    end
    it "has div for no comments" do
      visit blog_post_path(@blog_post)
      page.should have_selector(".no_comments")
      page.should_not have_selector(".comment")
    end
    it "shows comment if present" do
      @blog_post.comments.create!(user_name: "Jeremy Walker", user_email: "jez.walker@gmail.com", content: "Hello")
      visit blog_post_path(@blog_post)
      page.should have_selector(".comment")
    end
    
    it "has a new comment form" do
      visit blog_post_path(@blog_post)
      page.should have_selector("form", class: "new_blog_comment")
    end
    
    it "should create a comment and show it on the page" do
      visit blog_post_path(@blog_post)
      page.should_not have_selector(".comment")
      fill_in 'blog_comment_user_name', :with => 'Jeremy Walker'
      fill_in 'blog_comment_user_email', :with => 'jez.walker@gmail.com'
      fill_in 'blog_comment_content', :with => 'This is my comment'
      click_button 'Post Comment'
      page.should have_selector(".comment")
    end
  end
end
