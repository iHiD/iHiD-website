module ApplicationHelper

  def html_title
    if @metadata && @metadata[:title]
      @metadata[:title]
    else
      "Jeremy Walker - iHiD"
    end
  end

  def nl2br(text)
    text.gsub("\n", "<br/>")
  end

  # Converts foo\nbar\n\ncat to "<p>foo<br/>bar</p>cat</p>"
  def nl2p(text)
    nl2br text.split("\n\n").map{|line|"<p>#{line}</p>"}.join
  end

  def my_age_in_years
    years = Date.today.year - 1983
    years -= 1 if Date.today < Date.new(Date.today.year, 11, 13)
    years
  end

  def latest_blog_posts
    BlogPost.published.order("published_at desc").limit(5)
  end

  def canonical_link
    url = (@metadata && @metadata[:canonical]) || request.path
    url = "/#{url}" unless url.starts_with?("/")
    tag(:link, rel:"canonical", href:"http://www.ihid.co.uk#{url}")
  end
end
