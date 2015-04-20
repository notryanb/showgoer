class Artist < ActiveRecord::Base
  has_many :appearances
  has_many :concerts, through: :appearances
  has_many :videos

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def self.the_artist(artist)
    return first_artist = artist.first
  end

  def self.past_concerts(artist_name)
    artist_concerts = Concert.concerts_for_artist_name(artist_name).where('date_time < ?', DateTime.now)

    return artist_concerts
  end

  def self.future_concerts(artist_name)
    artist_concerts = Concert.concerts_for_artist_name(artist_name).where('date_time > ?', DateTime.now)
    return artist_concerts
  end

end
