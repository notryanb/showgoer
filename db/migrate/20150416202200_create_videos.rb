class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :caption
      t.string :url, null: false, unique: true
      t.string :thumbnail_url
      t.references :user
      t.references :artist
      t.references :concert

      t.timestamps null: false
    end
  end
end
