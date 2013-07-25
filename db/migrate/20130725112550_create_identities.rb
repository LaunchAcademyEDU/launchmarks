class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.integer :user_id
      t.string :uid
      t.string :provider

      t.timestamps
    end

    add_index :identities, [:uid, :provider], unique: true
  end
end
