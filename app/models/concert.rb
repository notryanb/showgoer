class Concert < ActiveRecord::Base
  has_many :appearances
  has_many :attends
  has_many :artists, through: :appearances
  has_many :videos

  def self.concerts_for_artist_name name
    Concert.joins(:artists).where('artists.name = ?', name)
  end


  def attendance
    self.attends.count
  end

end
