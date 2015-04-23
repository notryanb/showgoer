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


THUMBNAILS = [ "https://s3.amazonaws.com/dbc.showgoer.videos/BearTrade1.jpg", "https://s3.amazonaws.com/dbc.showgoer.videos/BearTrade2.jpg", "https://s3.amazonaws.com/dbc.showgoer.videos/BitPart1.jpg", "https://s3.amazonaws.com/dbc.showgoer.videos/Omadaka1.jpg"
]


 # Stubbed demo Concert for '/concerts/1501' route     # Stubbed demo Concert for '/concerts/1501' route
mb = Concert.create!(venue: "Mr. Beery's", date_time: "2015-03-30 20:00:00")
wp = Artist.create!(name: "Wax Phantom")
fp = Artist.create!(name: "Fellow Project")
vd = Artist.create!(name: "Veda")
ic = Artist.create!(name: "Iron Chic")

Appearance.create!(artist_id: ic.id, concert_id: mb.id)
Appearance.create!(artist_id: wp.id, concert_id: mb.id)
Appearance.create!(artist_id: fp.id, concert_id: mb.id)
Appearance.create!(artist_id: vd.id, concert_id: mb.id)

Video.create!(user_id: 6, concert_id: 1501, url: "https://s3.amazonaws.com/dbc.showgoer.videos/43a8f032-9864-4cbc-81b0-ea1660d3769fWax+Phantom+-+02.mp4", thumbnail_url: THUMBNAILS.sample)

Video.create!(user_id: 4, concert_id: 1501, url: "https://s3.amazonaws.com/dbc.showgoer.videos/Wax+Phantom+-+01.mp4", thumbnail_url: THUMBNAILS.sample)

Video.create!(user_id: 5, concert_id: 1501, url: "https://s3.amazonaws.com/dbc.showgoer.videos/Veda+-+03.mp4", thumbnail_url: THUMBNAILS.sample)
#------------------------------------------------------------------
ws = Concert.create!(venue: "Wood Shop, LI", date_time: "2015-02-15 19:00:00")
dp = Artist.create!(name: "Deep Pockets")

Appearance.create!(artist_id: ic.id, concert_id: ws.id)
Appearance.create!(artist_id: fp.id, concert_id: ws.id)
Appearance.create!(artist_id: dp.id, concert_id: ws.id)

Video.create!(user_id: 2, concert_id: ws, url: "https://s3.amazonaws.com/dbc.showgoer.videos/Bear+Trade+-+02+York+UK.mp4", thumbnail_url: THUMBNAILS[0])

Video.create!(user_id: 2, concert_id: 1501, url: "https://s3.amazonaws.com/dbc.showgoer.videos/BlipFest+2012+-+Bit+Shifter.mp4", thumbnail_url: THUMBNAILS[1])

Video.create!(user_id: 8, concert_id: 1501, url: "https://s3.amazonaws.com/dbc.showgoer.videos/d76342a4-3506-4263-bcdd-b81e5d48cf52Fellow+Project+-+04+Larissa_Greece.mp4", thumbnail_url: THUMBNAILS.sample)

#------------------------------------------------------------------
dba = Concert.create!(venue: "Death By Audio", date_time: "2014-11-01 18:30:00")
tm = Artist.create!(name: "Tenement")

Appearance.create!(artist_id: tm.id, concert_id: dba.id)
Appearance.create!(artist_id: ic.id, concert_id: dba.id)
Appearance.create!(artist_id: fp.id, concert_id: dba.id)

Video.create!(user_id: 11, concert_id: dba, url: "https://s3.amazonaws.com/dbc.showgoer.videos/Fellow+Project+-+03+Norwich+UK.mp4", thumbnail_url: THUMBNAILS.sample)

Video.create!(user_id: 1, concert_id: dba, url: "https://s3.amazonaws.com/dbc.showgoer.videos/Fellow+Project+-+02+Norwich+UK.mp4", thumbnail_url: THUMBNAILS[2])

Video.create!(user_id: 1, concert_id: dba, url: "https://s3.amazonaws.com/dbc.showgoer.videos/d76342a4-3506-4263-bcdd-b81e5d48cf52Fellow+Project+-+04+Larissa_Greece.mp4", thumbnail_url: THUMBNAILS[3])





















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

angel = User.create(email:"angelbaek1@gmail.com",
            password:"123",
            username: "awesomeangel",
            url: nil)

ben = User.create(email:"benjamin.cheng90@gmail.com",
            password:"123",
            username: "awesomeben",
            url: nil)

eveanandi = User.create(email:"butler.eveanandi@gmail.com",
            password:"123",
            username: "awesomeeveanandi",
            url: nil)

hoa = User.create(email:"hoathenguyen85@gmail.com",
            password:"123",
            username: "awesomehoa",
            url: nil)

kevin = User.create(email:"kevalwell@gmail.com",
            password:"123",
            username: "awesomekevin",
            url: nil)

natalia = User.create(email:"notika314@gmail.com",
            password:"123",
            username: "awesomenatalia",
            url: nil)

ryani = User.create(email:"ryanimmesberger@gmail.com",
            password:"123",
            username: "awesomeryani",
            url: nil)

sam = User.create(email:"samguergen@gmail.com",
            password:"123",
            username: "awesomesam",
            url: nil)
steph = User.create(email:"lo.stephaniec@gmail.com",
            password:"123",
            username: "awesomesteph",
            url: nil)
tracy = User.create(email:"tracy.teague05@gmail.com",
            password:"123",
            username: "awesometracy",
            url: nil)

lauren = User.create(email:"laurennicoleroth@gmail.com",
            password:"123",
            username: "awesomelauren",
            url: nil)

Following.create(originator_id:1,target_id:8)
Following.create(originator_id:1,target_id:9)
Following.create(originator_id:1,target_id:7)
Following.create(originator_id:1,target_id:6)
Following.create(originator_id:1,target_id:5)
Following.create(originator_id:1,target_id:11)

Following.create(originator_id:2,target_id:1)
Following.create(originator_id:2,target_id:3)

Following.create(originator_id:3,target_id:1)
Following.create(originator_id:3,target_id:2)

Following.create(originator_id:4,target_id:1)
Following.create(originator_id:4,target_id:3)

Following.create(originator_id:5,target_id:1)
Following.create(originator_id:5,target_id:3)

Following.create(originator_id:6,target_id:1)
Following.create(originator_id:6,target_id:2)

Following.create(originator_id:7,target_id:1)
Following.create(originator_id:7,target_id:3)

Following.create(originator_id:8,target_id:1)
Following.create(originator_id:8,target_id:3)

Following.create(originator_id:9,target_id:1)
Following.create(originator_id:9,target_id:2)

Following.create(originator_id:10,target_id:1)
Following.create(originator_id:10,target_id:3)

Following.create(originator_id:11,target_id:1)
Following.create(originator_id:11,target_id:3)

Following.create(originator_id:12,target_id:1)
Following.create(originator_id:12,target_id:2)

Following.create(originator_id:13,target_id:1)
Following.create(originator_id:13,target_id:2)

Following.create(originator_id:14,target_id:1)
Following.create(originator_id:14,target_id:2)
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

Attend.create(user_id: 3, concert_id: mb.id)
Attend.create(user_id: 4, concert_id: mb.id)
Attend.create(user_id: 5, concert_id: mb.id)
Attend.create(user_id: 6, concert_id: mb.id)
Attend.create(user_id: 7, concert_id: mb.id)

Attend.create(user_id: 8, concert_id: ws.id)
Attend.create(user_id: 9, concert_id: ws.id)
Attend.create(user_id: 10, concert_id: ws.id)
Attend.create(user_id: 11, concert_id: ws.id)
Attend.create(user_id: 12, concert_id: ws.id)
Attend.create(user_id: 13, concert_id: ws.id)
Attend.create(user_id: 14, concert_id: ws.id)

Attend.create(user_id: 2, concert_id: ws.id)
Attend.create(user_id: 4, concert_id: ws.id)
Attend.create(user_id: 6, concert_id: ws.id)
Attend.create(user_id: 8, concert_id: ws.id)
Attend.create(user_id: 10, concert_id: ws.id)
Attend.create(user_id: 12, concert_id: ws.id)
Attend.create(user_id: 14, concert_id: ws.id)