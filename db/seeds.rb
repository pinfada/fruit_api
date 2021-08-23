# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Suppress tables before charge
Cotation.delete_all # suppression de la table cotation
Cotation.reset_pk_sequence # remise de l'id à 1 pour table Cotation
Price.delete_all # suppression de la table price
Price.reset_pk_sequence # remise de l'id à 1 pour table price
Characteristic.delete_all # suppression de la table Characteristic
Characteristic.reset_pk_sequence # remise de l'id à 1 pour table Characteristic
Product.delete_all # suppression de la table produit
Product.reset_pk_sequence # remise de l'id à 1 pour table produit
Market.delete_all # suppression de la table market
Market.reset_pk_sequence # remise de l'id à 1 pour table market

require './db/seeds/market'
require './db/seeds/product'
require './db/seeds/characteristic'
require './db/seeds/price'
require './db/seeds/cotation'
