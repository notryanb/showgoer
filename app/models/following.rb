class Following < ActiveRecord::Base
  belongs_to :originator, class_name: 'User', foreign_key: :originator_id
  belongs_to :target, class_name: 'User', foreign_key: :target_id
end