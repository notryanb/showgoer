class CreateAttends < ActiveRecord::Migration
  def change
    create_table :attends do |t|
      t.belongs_to :user
      t.belongs_to :concert

      t.timestamps null: false
    end
  end
end
