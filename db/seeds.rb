# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'httparty'

# CREATE CONCERTS
30.times do |day|
  day += 1

  if day < 10
    api_request = "http://api.bandsintown.com/events/search.json?location=Brooklyn,NY&date=2015-03-0"+day.to_s+"&app_id=SHOWGOER"
  else
    api_request = "http://api.bandsintown.com/events/search.json?location=Brooklyn,NY&date=2015-03-"+day.to_s+"&app_id=SHOWGOER"
  end
    brklyn = HTTParty.get(api_request)

    brklyn.each do |event|
      newConcert = Concert.create!(venue: event['venue']['name'], date_time:event['datetime'])
      event['artists'].each do |artist|
        existing = Artist.find_by(name: artist['name'])
        if existing
          Appearance.create!(artist: existing, concert_id: newConcert.id)
        else
          newArtist = Artist.create!(name:artist['name'])
          Appearance.create!(artist: newArtist, concert_id: newConcert.id)
        end
      end
    end

end


# Stubbed demo Concert for '/concerts/1501' route
mb = Concert.create!(venue: "Mr. Beery's", date_time: "2015-03-30 20:00:00")
wp = Artist.create!(name: "Wax Phantom")
fp = Artist.create!(name: "Fellow Project")

Appearance.create!(artist_id: wp.id, concert_id: mb.id)
Appearance.create!(artist_id: fp.id, concert_id: mb.id)

























# Kirans Seed Data

kiran = User.create(email:"kiran@gmail.com",
            password:"123",
            username: "kirawesome",
            url: "/img/kiran.jpg")

ryan = User.create(email:"ryan@gmail.com",
            password:"123",
            username: "notryanb",
            url: "/img/ryan.jpg")

malcolm = User.create(email:"malcolm@gmail.com",
            password:"123",
            username: "awesomesaucemalcolm",
            url: "/img/malcolm.jpg")

# saintsofvalory = Artist.create(name:"Saints of Valory",
#             url: "/img/saintsofvalory.jpg",
#   )

# concerts1 = Concert.create(venue: "Michigan", date_time: "Sun, 01 Mar 2015 04:00:00 UTC +00:00")
# concerts2 = Concert.create(venue: "Illinois", date_time: "Sun, 01 Mar 2015 04:00:00 UTC +00:00")
# concerts3 = Concert.create(venue: "indiana", date_time: "Sun, 01 Mar 2015 04:00:00 UTC +00:00")
# concerts4 = Concert.create(venue: "New York", date_time: "Sun, 01 Mar 2012 04:00:00 UTC +00:00")
# concerts5 = Concert.create(venue: "New Jersey", date_time: "Sun, 01 Mar 2012 04:00:00 UTC +00:00")
# concerts6 = Concert.create(venue: "Florida", date_time: "Sun, 01 Mar 2012 04:00:00 UTC +00:00")

# appearance1 = Appearance.create(artist_id: 1, concert_id:1)
# appearance2 = Appearance.create(artist_id: 1, concert_id:2)
# appearance3 = Appearance.create(artist_id: 1, concert_id:3)
# appearance4 = Appearance.create(artist_id: 1, concert_id:4)
# appearance5 = Appearance.create(artist_id: 1, concert_id:5)
# appearance6 = Appearance.create(artist_id: 1, concert_id:6)
# appearance7 = Appearance.create(artist_id: 1, concert_id:1)
# appearance8 = Appearance.create(artist_id: 1, concert_id:2)