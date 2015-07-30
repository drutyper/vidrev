class AddQueryToYoutubes < ActiveRecord::Migration
  def change
    add_column :youtubes, :query, :string
    add_index :youtubes, :query
  end
end
