class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :blog_post_id, null:false
      
      t.string  :user_name,  null: false
      t.string  :user_email, null: false
      
      t.text    :content,    null: false
      t.boolean :verified,   null: false, default: false
      t.timestamps
    end
    
    add_foreign_key :comments, :blog_posts, column: :blog_post_id
  end
end
