class Video < ActiveRecord::Base
  belongs_to :artist
  belongs_to :concert
  belongs_to :user
end
