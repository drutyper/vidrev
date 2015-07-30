class AddSearchToTwitches < ActiveRecord::Migration
  def change
    add_column :twitches, :search, :string
    add_index :twitches, :search
  end
end
