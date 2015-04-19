class Concert < ActiveRecord::Base
  has_many :appearances
  has_many :artists, through: :appearances
  has_many :videos

  def self.concerts_for_artist_name name
    Concert.joins(:artists).where('artists.name = ?', name)
  end

end
