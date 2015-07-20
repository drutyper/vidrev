class CreateYoutubes < ActiveRecord::Migration
  def change
    create_table :youtubes do |t|
      t.string :videoId
      t.string :title
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
