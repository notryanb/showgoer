class Artist < ActiveRecord::Base
  has_many :appearances
  has_many :concerts, through: :appearances
  has_many :videos

  def self.the_artist(artist)
    return first_artist = artist.first
  end

  def self.past_concerts(artist_name)
    pastconcerts = []
    artist_concerts = Concert.concerts_for_artist_name(artist_name)
    artist_concerts.each do |concert|
      if DateTime.now > concert.date_time
        pastconcerts << concert
      end
    end
    return pastconcerts
  end

  def self.future_concerts(artist_name)
    futureconcerts = []
    artist_concerts = Concert.concerts_for_artist_name(artist_name)
    artist_concerts.each do |concert|
      if DateTime.now < concert.date_time
        futureconcerts << concert
      end
    end
    return futureconcerts
  end

end
