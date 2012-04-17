require 'spec_helper'

describe "Blog Posts" do
  it "Creating a blog post" do
    
    title = "foobar"
    content = "<p>foobar's content</p>"
    
    visit admin_blog_posts_path
    click_button "Create New Post"
    fill_in "blog_post_title", with: title
    fill_in "blog_post_content", with: content
    click_button :submit
    
    page.should have_selector("#blog_post")
    page.should have_selector("h2", :text => title)
    page.should have_selector(".content", :content => content)
  end
  
  it "Edit a blog post's content" do
    
    blog_post = BlogPost.create!(title:"Blog Post To Edit", content: "blog post to edit's content")
    new_content = "#{blog_post.content}foobar"
    
    visit edit_admin_blog_post_path(blog_post)
    fill_in "blog_post_content", with: new_content
    click_button :submit
    page.should have_selector(".content", :content => new_content)
  end
  
  it "Edit a blog post's title" do
    
    blog_post = BlogPost.create!(title:"Blog Post To Edit", content: "blog post to edit's content")
    new_title = "#{blog_post.title} foobar"
    
    visit edit_admin_blog_post_path(blog_post)
    fill_in "blog_post_title", with: new_title
    click_button :submit
    page.should have_selector("h2", :text => new_title)
  end
end
