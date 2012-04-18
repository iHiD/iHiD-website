module PagesHelper
  
  def sitemap_url_tag(url, lastmod, changefreq, priority)
    url = "http://www.ihid.co.uk#{url}" if url.starts_with?("/")
    content_tag(:url) do
      content_tag(:loc, url) + 
      content_tag(:lastmod, lastmod.strftime("%Y-%m-%dT%H:%MZ")) + 
      content_tag(:changefreq, changefreq) + 
      content_tag(:priority,  priority)
    end
  end
  
end
