class AddAuthorToBookmark < ActiveRecord::Migration
  def change
    add_column :bookmarks, :author_id, :integer
    remove_index :bookmarks, :url

    add_index :bookmarks, :author_id
  end
end
