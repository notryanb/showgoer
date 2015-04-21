class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :originator_id
      t.integer :target_id
    end
  end
end
