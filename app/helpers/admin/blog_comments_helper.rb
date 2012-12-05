module Admin::BlogCommentsHelper
  def admin_blog_comment_class(comment)
    "comment " + 
    if comment.verified?
      'verified' 
    elsif comment.probably_spam?
      'probably_spam'
    else
      ""
    end
  end
end
