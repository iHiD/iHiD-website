require 'spec_helper'

describe "Sessions" do
  it "should redirect if there's no session" do
    visit admin_blog_posts_path
    page.should have_selector("h2", :text => "Please Login")
  end
end
