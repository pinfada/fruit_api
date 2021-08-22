# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Suppress tables before charge
Characteristic.delete_all # suppression de la table Characteristic
Characteristic.reset_pk_sequence # remise de l'id à 1 pour table Characteristic
Product.delete_all # suppression de la table produit
Product.reset_pk_sequence # remise de l'id à 1 pour table produit
Market.delete_all # suppression de la table market
Market.reset_pk_sequence # remise de l'id à 1 pour table market

require './db/seeds/market'
require './db/seeds/product'
require './db/seeds/characteristic'
