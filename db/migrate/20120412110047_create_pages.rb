class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name,     null: false
      t.string :slug,     null: false
      t.string :template, null: false
      t.timestamps
    end
    add_index :pages, :slug, unique: true
  end
end
