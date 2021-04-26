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

gabriel = User.new(nickname: "Gab", password: "azerty", email: "gabriel@gmail.com")
gabriel.save!

francois = User.new(nickname: "Francis", password: "azerty", email: "francois@lewagon.org")
francois.save!
puts 'Finished !'

users = [clement, gabriel, francois]

puts 'Creating products...'
boss_shirt = Product.create!(user: users.sample, name: "T-shirt Hugo Boss", price: 10, category: "T-shirts", gender: "homme", description: "T-shirt bleu marine")
boss_shirt.save!

levis_jean = Product.create!(user: users.sample, name: "Jean Levis", price: 15, category: "Jeans", gender: "homme", description: "Jean coupe slim")
levis_jean.save!

nike_jacket = Product.create!(user: users.sample, name: "Veste Nike", price: 10, category: "Vestes", gender: "femme", description: "Veste jaune avec poches intérieures")
nike_jacket.save!
puts 'Finished !'

coat_napapijri = Product.create!(user: users.sample, name: "Manteau Napapijri", price: 10, category: "Manteaus", gender: "homme", description: "Manteau coupe vent à capuche")
coat_napapijri.save!

carhartt_pant = Product.create!(user: users.sample, name: "Pantalon Carhartt", price: 5, category: "Jeans", gender: "homme", description: "Pantalon en velour beige")
carhartt_pant.save!

balenciaga_skirt = Product.create!(user: users.sample, name: "Jupe Balenciaga", price: 20, category: "Jupes", gender: "femme", description: "Jupe Balenciaga en coton")
balenciaga_skirt.save!
puts 'Finished !'
