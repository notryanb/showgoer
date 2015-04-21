class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :video

  validates :content, :user, :video, presence: true
end
