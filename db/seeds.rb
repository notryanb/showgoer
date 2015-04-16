# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'httparty'

brklyn = HTTParty.get('http://api.bandsintown.com/events/search.json?location=Brooklyn,NY&date=2015-01-01,2015-04-16&app_id=YOUR_APP_ID')

# p brklyn[0]['artists'][0]['name']

brklyn.each do |event|
  # puts "Venue Name: #{event['venue']['name']}"
  # puts "Venue City: #{event['venue']['city']}"
  # puts "Venue Country: #{event['venue']['country']}"
  # puts "Date and Time: #{event['datetime']}"
  newConcert = Concert.create!(venue: event['venue']['name'], date_time:event['datetime'])
  event['artists'].each do |artist|
    # puts artist['name']
    newArtist = Artist.create!(name:artist['name'])
    Appearance.create!(artist_id: newArtist.id, concert_id: newConcert.id)
  end
    p '------------'
end