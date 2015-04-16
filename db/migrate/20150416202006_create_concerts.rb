class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :venue, null: false
      t.datetime :date_time, null: false

      t.timestamps null: false
    end
  end
end
