class CreateTwitches < ActiveRecord::Migration
  def change
    create_table :twitches do |t|
      t.string :stream_id
      t.string :game
      t.integer :viewers
      t.string :preview
      t.string :links

      t.timestamps null: false
    end
  end
end
