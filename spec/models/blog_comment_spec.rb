require 'spec_helper'

describe BlogComment do
  it "should get gravatar url" do
    comment = BlogComment.new(user_email: "jez.walker@gmail.com")
    gravatar_id = Digest::MD5::hexdigest(comment.user_email).downcase
    comment.user_gravatar_url.should == "http://gravatar.com/avatar/#{gravatar_id}.png?s=50"
  end
end