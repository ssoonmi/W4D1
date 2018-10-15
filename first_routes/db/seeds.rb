# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

u1 = User.create!(username: 'aaron420')
u2 = User.create!(username: 'soonmi_panda')

a1 = Artwork.create!(title: 'Panda eating', image_url: 'panda_eats.com', artist_id: u2.id)
a2 = Artwork.create!(title: 'weeds flowing in the wind', image_url: 'smokin.thestuff', artist_id: u1.id)

s1 = ArtworkShare.create!(viewer_id: u1.id, artwork_id: a1.id)
s2 = ArtworkShare.create!(viewer_id: u2.id, artwork_id: a2.id)
