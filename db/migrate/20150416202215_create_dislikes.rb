class CreateDislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.belongs_to :user
      t.belongs_to :video

      t.timestamps null: false
    end
  end
end
