# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Player.create!(player_name: "Seung Mina",
               life_points: 100,
               attack_points: 100,
               )

Player.create!(player_name: "Cervantes",
               life_points: 100,
               attack_points: 90,
               )
