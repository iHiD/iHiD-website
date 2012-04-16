module ApplicationHelper
  
  def html_title
    "iHiD - Jeremy Walker"
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
  
end
