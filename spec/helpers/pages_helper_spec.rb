require 'spec_helper'

describe ApplicationHelper do
  describe "sitemap_url_tag" do
    it "should return the correct xml" do
      sitemap_xml = "<url><loc>https://www.ihid.co.uk/pages/1</loc><lastmod>2012-02-17T00:00Z</lastmod><changefreq>weekly</changefreq><priority>1</priority></url>"
      helper.sitemap_url_tag("/pages/1", DateTime.new(2012,2,17), "weekly", 1).should == sitemap_xml
    end
  end
end