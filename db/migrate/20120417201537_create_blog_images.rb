class CreateBlogImages < ActiveRecord::Migration
  def change
    create_table :blog_images do |t|
      t.has_attached_file :file
      t.timestamps
    end
  end
end
