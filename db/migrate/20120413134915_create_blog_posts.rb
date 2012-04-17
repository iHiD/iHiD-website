class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title,   null: false
      t.text   :content, null: false
      t.string :slug,    null: false
      
      t.datetime :created_at, null:false
      t.datetime :updated_at, null:false
      t.datetime :published_at, null:true
    end
  end
end
