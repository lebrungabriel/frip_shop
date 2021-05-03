# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts 'Cleaning up local db...'

# Order.destroy_all
Product.destroy_all
User.destroy_all

puts 'Finished'

puts 'Creating users...'
clement = User.new(nickname: "Clem", password: "azerty", email: "clement@lewagon.org")
clement.save!

gabriel = User.new(nickname: "Gab", password: "azerty", email: "gabriel@lewagon.org")
gabriel.save!

francois = User.new(nickname: "Francis", password: "azerty", email: "francois@lewagon.org")
francois.save!
puts 'Finished !'

users = [clement, gabriel, francois]

puts 'Creating products...'
boss_shirt = Product.create!(user: users.sample,
                             name: "T-shirt Hugo Boss",
                             price: 10,
                             category: "T-shirts",
                             gender: "homme",
                             color: "Gris",
                             description: "T-shirt manches longues",
                             size: "L")
boss_shirt.save!

levis_jean = Product.create!(user: users.sample,
                             name: "Jean Levis",
                             price: 15,
                             category: "Jeans",
                             gender: "homme",
                             color: "Rouge",
                             description: "Jean coupe slim",
                             size: "M")
levis_jean.save!

nike_jacket = Product.create!(user: users.sample,
                             name: "Veste Nike",
                             price: 10,
                             category: "Vestes",
                             gender: "femme",
                             color: "Bleu",
                             description: "Veste en tissu avec poches intérieures",
                             size: "XS")
nike_jacket.save!

coat_napapijri = Product.create!(user: users.sample,
                             name: "Manteau Napapijri",
                             price: 10,
                             category: "Manteaus",
                             gender: "homme",
                             color: "Vert",
                             description: "Manteau coupe vent à capuche",
                             size: "XL")
coat_napapijri.save!

carhartt_pant = Product.create!(user: users.sample,
                             name: "Pantalon Carhartt",
                             price: 5,
                             category: "Jeans",
                             gender: "homme",
                             color: "Noir",
                             description: "Pantalon en velour",
                             size: "L")
carhartt_pant.save!

balenciaga_skirt = Product.create!(user: users.sample,
                             name: "Jupe Balenciaga",
                             price: 20,
                             category: "Jupes",
                             gender: "femme",
                             color: "Jaune",
                             description: "Jupe Balenciaga en coton",
                             size: "S")
balenciaga_skirt.save!
puts 'Finished !'
