Page.create!(name:"personal",     template:"personal")
Page.create!(name:"professional", template:"professional")

Project.create!(
  name:             "belongs_to_enum",
  descriptive_name: "Belongs To Enum (Rails Gem)",
  description:      "Key/value enums for Rails.",
  github_url:       "http://github.com/ihid/belongs_to_enum",
  template:         "belongs_to_enum"
)

Project.create!(
  name:             "super_sti",
  descriptive_name: "Super STI - Improved single table inheritance for Rails.",
  description:      "",
  github_url:       "http://github.com/ihid/super_sti",
  template:         "super_sti"
)

Project.create!(
  name:             "Simple IOS Widgets",
  descriptive_name: "Simple Widgets for IOS",
  description:      "A library of simple, lightweight IOS widgets, which either add new views (e.g. pie charts) or new functionality to existing views (e.g. auto-scaling UIWebViews).",
  github_url:       "http://github.com/ihid/simple_ios_widgets",
  template:         "simple_ios_widgets"
)

Project.create!(
  name:             "This Website",
  descriptive_name: "The Source Code of ihid.co.uk",
  description:      "This website is open-source. Read the code, use the code, fork the code - it's up to you.",
  github_url:       "http://github.com/ihid/website",
  template:         "website"
)

BlogPost.create!(
  title: "Testing views with Rails 3, Rspec 2 and Webrat",
  created_at: Date.new(2011, 5, 10),
  content: <<-EOS
<p>I just lost an hour of my life on this issue, so hopefully I'll save someone else the waste!</p>
<p>My code:</p>

<pre><code class="ruby">
require 'spec_helper'
describe ExamsController do
  it "should present the user with the new exam form" do
    get :index
    response.should have_selector('form#new_practice_exam_form')
  end
end
</code></pre>


<p>The output:
<pre><code>
<div>Failure/Error: response.should have_selector("<form#new_practice_exam_form/>")
expected following output to contain a tag:
&lt;!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd"&gt;
</code></pre>
<p>Firstly, ignore the weird form tag it suggests it's looking for - this is a red herring. Webrat just outputs error messages badly.<p>

<p>The actual issue is simply that the HTML is not being rendered. By default, the views are not rendered in controller tests. One line of code fixes this:
<pre><code class="ruby">
require 'spec_helper'
 
describe ExamsController do
  render_views
  it "should present the user with the new exam form" do
    get :index
    response.should have_selector('form#new_practice_exam_form')
  end
end
</code></pre>

<p>Hope that helps someone!!</p>

<p><em>Update:As Snuggs points out in his comment below, if you find yourself testing view code in the controller, you're probably doing something wrong. View tests and integration (or request) tests are the correct place for this.</em></p>
EOS
)


BlogPost.create!(
  title: "Creating an EC2 webserver using Amazon's basic AMI.",
  created_at: Date.new(2011, 5, 17),
  content: <<-EOS
<p>Today I setup a new x64 server on EC2 using Amazon's homemade AMI.</p>
<p>This is the bash script I wrote to replicate what I did. It should set you up with a working Apache/Passenger/mysql install, along with Memcached and Imagemagick.</p>
<p>Note: This will not configure a MySQL server as I'm talking to Amazon RDS.</p>

<pre><code class="bash">
sudo yum install -y httpd httpd-devel mysql mysql-devel git patch gcc gcc-devel make zlib-devel curl-devel openssl openssl-devel gcc gcc-c++ kernel-devel libxml2-devel ImageMagick ImageMagick-devel libxslt libxslt-devel memcached
 
bash &lt; &lt;(curl -s https://rvm.beginrescueend.com/install/rvm)
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' &gt;&gt; ~/.bash_profile
source .bash_profile
rvm install 1.9.2
rvm use 1.9.2 --default
gem install passenger
passenger-install-apache2-module
 
echo 'export rvm_pretty_print_flag=1' &gt;&gt; ~/.rvmrc.
 
sudo chkconfig httpd on
sudo chkconfig memcached on
 
mkdir ~/tmp
git clone git://github.com/drogus/apache-upload-progress-module.git ~/tmp/progress
cd ~/tmp/progress
sudo apxs -c -i -a mod_upload_progress.c
 
echo "Now copy these lines into httpd.conf. CHECK THE PASSENGER VERSION"
echo "LoadModule passenger_module /home/ec2-user/.rvm/gems/ruby-1.9.2-p180/gems/passenger-3.0.7/ext/apache2/mod_passenger.so"
echo "PassengerRoot /home/ec2-user/.rvm/gems/ruby-1.9.2-p180/gems/passenger-3.0.7"
echo "PassengerRuby /home/ec2-user/.rvm/wrappers/ruby-1.9.2-p180/ruby"
echo "LoadModule upload_progress_module /usr/lib64/httpd/modules/mod_upload_progress.so"
</code></pre>
EOS
)