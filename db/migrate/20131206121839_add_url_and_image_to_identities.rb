class AddUrlAndImageToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :url, :string
    add_column :identities, :image, :string
  end
end
