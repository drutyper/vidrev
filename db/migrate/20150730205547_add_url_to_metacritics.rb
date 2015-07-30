class AddUrlToMetacritics < ActiveRecord::Migration
  def change
    add_column :metacritics, :url, :string
    add_index :metacritics, :url
  end
end
