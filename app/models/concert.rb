class Concert < ActiveRecord::Base
  has_many :appearances
  has_many :artists, through: :appearances
  has_many :videos
end
