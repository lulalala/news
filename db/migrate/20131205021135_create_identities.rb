class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user
      t.string :uid
      t.string :provider
      t.text :raw
    end

    add_index :identities, :user_id
    add_index :identities, :uid
  end
end
