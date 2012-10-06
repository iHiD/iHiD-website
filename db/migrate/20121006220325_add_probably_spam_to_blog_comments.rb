class AddProbablySpamToBlogComments < ActiveRecord::Migration
  def change
    add_column :blog_comments, :probably_spam, :boolean, default: false, null: false
  end
end
