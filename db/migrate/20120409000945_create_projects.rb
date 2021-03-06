class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name,             null: false
      t.string :descriptive_name, null: false
      t.text   :description,      null: false
      t.string :github_url,       null: false
      t.string :slug,             null: false
      t.string :template,         null: false
      t.timestamps
    end
    add_index :projects, :slug, unique: true
  end
end
