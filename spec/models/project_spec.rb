require 'spec_helper'

describe Project do
  it "requires a name" do
    Project.create(name:"").errors[:name].should_not be_blank
  end
  it "requires an action" do
    Project.create(template:"").errors[:template].should_not be_blank
  end
  it "gets a sensible slug" do
    defaults = {descriptive_name: "descriptive_name", description: "description", github_url: "github_url", template:"template"}
    Project.destroy_all
    Project.create!(defaults.merge(name:"hello")).slug.should == "hello"
    Project.create!(defaults.merge(name:"hello world")).slug.should == "hello-world"
  end
end
