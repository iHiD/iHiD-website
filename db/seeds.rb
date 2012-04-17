Page.create!(name:"about", template:"about")

Project.create!(
  name:             "belongs_to_enum",
  descriptive_name: "belongs_to_enum - C# (or Java) style Enums in Rails",
  description:      "Adds C# (or Java) style Enums to Rails via a belongs_to_enum method in ActiveRecord",
  github_url:       "http://github.com/ihid/belongs_to_enum",
  template:         "belongs_to_enum"
)

Project.create!(
  name:             "super_sti",
  descriptive_name: "super_sti - Improved single table inheritance for Rails.",
  description:      "Improves Rails STI by adding a has_extra_data method to ActiveRecord, which invisibly includes an extra data table. It helps keep the database clean by removing the need for nullable columns.",
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

blog_image = BlogImage.create!(file:File.open("lib/import/advertising.png"))
blog_post = BlogPost.create!(
  title: "Highly Targeted Advertising on ruby-forum.com",
  published_at: Date.new(2011, 5, 18),
  content: <<-EOS
<p>So, I'm minding my own business reminding myself of the Ruby Hash#inject syntax when I noticed the following ridiculously targeted advertising (we just bought a Mazda RX-8):</p>
<p><img src="#{blog_image.file.url(:full_width)}"/></p>
<p>I'm presuming they add a cookie while I'm browsing quotes and then the advertising provider checks for cookies that can be targeted when I hit their pages. That's very clever.</p>
EOS
)
comment = blog_post.comments.create!(
  user_name: "Liz Walker",
  user_email: "serenthia@gmail.com",
  content: "Your friendly neighbourhood car insurance comparison site?"
)
comment.created_at = DateTime.new(2011,5,18,15)
comment.save!

comment = blog_post.comments.create!(
  user_name: "Jeremy Walker",
  user_email: "jez.walker@gmail.com",
  content: "Indeed, and I guess I'll still get this even if I tick the \"don't send me stuff\" and \"don't share my details\" boxes - annoying but clever."
)
comment.created_at = DateTime.new(2011,5,18,15,4)
comment.save!

comment = blog_post.comments.create!(
  user_name: "Alastair Langstaff",
  user_email: "ali@angelz.com",
  content: "*Something about ad-block*"
)
comment.created_at = DateTime.new(2011,5,18,15,25)
comment.save!

blog_post = BlogPost.create!(
  title: "Testing views with Rails 3, Rspec 2 and Webrat",
  published_at: Date.new(2011, 5, 10),
  content: <<-EOS
<p>I just lost an hour of my life on this issue, so hopefully I'll save someone else the waste!</p>
<p>My code:</p>

<pre><code class="ruby">require 'spec_helper'
describe ExamsController do
  it "should present the user with the new exam form" do
    get :index
    response.should have_selector('form#new_practice_exam_form')
  end
end
</code></pre>


<p>The output:
<pre><code>Failure/Error: response.should have_selector("<form#new_practice_exam_form/>")
expected following output to contain a tag:
&lt;!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd"&gt;
</code></pre>
<p>Firstly, ignore the weird form tag it suggests it's looking for - this is a red herring. Webrat just outputs error messages badly.<p>

<p>The actual issue is simply that the HTML is not being rendered. By default, the views are not rendered in controller tests. One line of code fixes this:
<pre><code class="ruby">require 'spec_helper'
 
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

comment = blog_post.comments.create!(
  user_name: "Snuggles",
  user_email: "rashaunstovall@gmail.com",
  content: <<-EOS
  Or you could just do view specs
- specs
- views
- your_view.html.erb_spec.rb

By default all view specs have a
:type => :request
option. You can set your describe type to be the same to get this functionality but this is usually a sign you are testing in the wrong area of your specs. Yes view tests aren't en vogue but at the end of the day you need to know if that form is on the page.

- Regards
EOS
)
comment.created_at = DateTime.new(2011,5,26,14,02)
comment.save!

comment = blog_post.comments.new(
  user_name: "Jeremy Walker",
  user_email: "jez.walker@gmail.com",
  content: <<-EOS
Hi Snuggs,

Thanks for your comment. I actually subsequently moved this code into a view test just like you suggested. I also have a request test that checks this in a slightly different way.

I've updated the post to note your comment. Thanks!
EOS
)
comment.created_at = DateTime.new(2011,5,26,14,19)
comment.save!

BlogPost.create!(
  title: "Creating an EC2 webserver using Amazon's basic AMI.",
  published_at: Date.new(2011, 5, 17),
  content: <<-EOS
<p>Today I setup a new x64 server on EC2 using Amazon's homemade AMI.</p>
<p>This is the bash script I wrote to replicate what I did. It should set you up with a working Apache/Passenger/mysql install, along with Memcached and Imagemagick.</p>
<p>Note: This will not configure a MySQL server as I'm talking to Amazon RDS.</p>

<pre><code class="bash">sudo yum install -y httpd httpd-devel mysql mysql-devel git patch gcc gcc-devel make zlib-devel curl-devel openssl openssl-devel gcc gcc-c++ kernel-devel libxml2-devel ImageMagick ImageMagick-devel libxslt libxslt-devel memcached
 
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

BlogPost.create!(
  title: "Bug in Rails 3.2 ActiveRecord Store - TypeError: can't convert Symbol into Integer",
  published_at: DateTime.new(2012, 2, 1, 19, 26),
  content: <<-EOS
<p><strong>Update: I've now fixed this and it's been merged into Rails core, so use the master branch is you're having this issue.</strong></p>
<p>If you have a non-nullable database column that you are using for the db backing of the new ActiveRecord Store in Rails 3.2, you will probably get an error such as:</p>

<pre><code style="ruby">TypeError: can't convert Symbol into Integer
from .../activerecord-3.2.1/lib/active_record/store.rb:39:in `[]='
</code></pre>

<p>To fix it, change your column to :null => true</p>
<p>I've logged an <a href="https://github.com/rails/rails/issues/4840">issue report on github</a>.</p>
EOS
)

BlogPost.create!(
  title: "A scope for returning no records in ActiveRecord",
  published_at: DateTime.new(2012, 1, 22, 19, 26),
  content: <<-EOS
<p><strong>Update: A version by xuanxu has now <a href="https://github.com/rails/rails/pull/4805">been accepted into Rails core</a>.</strong></p>
<p>I've added a scope for .none which returns no records and skips the database. Check out my <a href="https://github.com/rails/rails/pull/4548">pull request</a> on rails master - any thoughts or improvements are welcome!</p>
<p>Credit to <a href="https://github.com/xuanxu">xuanxu</a> for the idea.</p>
EOS
)


BlogPost.create!(
  title: "Allow escape_attrs on a per tag basis in HAML",
  published_at: DateTime.new(2012, 1, 22, 19, 04),
  content: <<-EOS
<p>I've sent a pull request that allows escape_attrs to be overridden on a per tag basis. This is especially useful for me in using Backbone templates in a certain section of my app, that requires escape_attrs to be set to false, but where I want the rest to be set to true as normal.</p>
<p>My HAML fork is at <a href="https://github.com/ihid/haml">https://github.com/ihid/haml</a>
<br/>
The pull request is at <a href="https://github.com/nex3/haml/pull/483">https://github.com/nex3/haml/pull/483</a>
</p>
<p>I'll update this if it gets accepted.</p>
EOS
)

BlogPost.create!(
  title: "Form select tag does not accept ranges in Rails 3.2",
  published_at: DateTime.new(2012, 1, 22, 13, 54),
  content: <<-EOS
<p>Until Rails 3.2 you could pass a range (1..5) as the choices parameter to form.select. This is now broken. However, it still works with select_tag.</p>
<p>The error message is "ActionView::Template::Error (undefined method `empty?' for x..y:Range)". This is due to a change in the way the code checks for grouped_selects.</p>
<p>I've fixed this on 3-2-stable and on master, so get the latest version from git and it will work fine for you.</p>
EOS
)


BlogPost.create!(
  title: "HAML is broken with Partial Layouts",
  published_at: DateTime.new(2011, 6, 18, 21, 50),
  content: <<-EOS
<p style="color:red">This is now fixed. See <a href="https://github.com/nex3/haml/commit/e617535692d5835541b7b996bf7f235f39e3561b">github</a> for details.<p>
<p>For a couple of weeks partial layouts have been broken in HAML. I opened an issue at <a href="https://github.com/nex3/haml/issues/403">Github</a>.</p>
<p>The problem manifests itself by outputting the resulting HTML in the wrong place and sometimes twice.</p>
<p>The issue was caused by <a href="https://github.com/nex3/haml/commit/10109d4eb1fcaa83d175fe216ba452bef70b2019">this commit</a>, which attempted to "fix #capture when run with a block that returns a string." but broke partial layouts in the process. It did actually cause a test to fail, but it seems that was missed.</p>
<p>I've made a fork at <a href="https://github.com/ihid/haml">https://github.com/ihid/haml</a> which fixes this regression for now. You can update your Gemfile with:</p>

<pre><code style="ruby">gem 'haml', :git => "git://github.com/ihid/haml.git"
</code></pre>
EOS
)

