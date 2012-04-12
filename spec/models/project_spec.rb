require 'spec_helper'

describe Project do
  it "requires a name" do
    Project.create(name:"").errors[:name].should_not be_blank
  end
  it "requires an action" do
    Project.create(template:"").errors[:template].should_not be_blank
  end
  it "gets a sensible slug" do
    Project.create!(name:"hello", template:"foobar").slug.should == "hello"
    Project.create!(name:"hello world", template:"foobar").slug.should == "hello-world"
  end
end
