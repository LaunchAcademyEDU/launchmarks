class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :description

      t.timestamps
    end

    add_index :bookmarks, :url, unique: true
  end
end
