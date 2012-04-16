module ApplicationHelper
  
  def html_title
    "iHiD - Jeremy Walker"
  end
  
  def nl2br(text)
    text.gsub("\n", "<br/>")
  end
  
end
