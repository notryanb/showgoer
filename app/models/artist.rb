class Artist < ActiveRecord::Base
  has_many :appearances
  has_many :concerts, through: :appearances
  has_many :videos
end
