module ApplicationHelper
  
  def html_title
    "iHiD - Jeremy Walker"
  end
  
  def nl2br(text)
    text.gsub("\n", "<br/>")
  end
  
  def nl2p(text)
    text.split("\n").map{|line|"<p>#{line}</p>"}.join
  end
  
  def my_age_in_years
    years = Date.today.year - 1983
    years -= 1 if Date.today < Date.new(Date.today.year, 11, 13)
    years
  end
  
end
