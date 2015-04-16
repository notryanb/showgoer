class CreateAppearances < ActiveRecord::Migration
  def change
    create_table :appearances do |t|
      t.belongs_to :artist
      t.belongs_to :concert

      t.timestamps null: false
    end
  end
end
