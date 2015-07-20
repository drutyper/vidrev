class CreateMetacritics < ActiveRecord::Migration
  def change
    create_table :metacritics do |t|
      t.string :critic
      t.integer :score
      t.text :excerpt
      t.string :link
      t.string :date

      t.timestamps null: false
    end
  end
end
