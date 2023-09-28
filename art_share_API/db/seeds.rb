# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'omar')
User.create(name: 'luke')
Artwork.create(title: "Mona Lisa", image_url: "example14.com", artist_id: 1)
Artwork.create(title: "Starry Night", image_url: "example15.com", artist_id: 2)
Artwork.create(title: "Bowl of Fruit", image_url: "example16.com", artist_id: 3)
Artwork.create(title: "Crayon Drawing", image_url: "example17.com", artist_id: 4)
