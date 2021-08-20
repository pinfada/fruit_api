# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

Product.delete_all # suppression de la table produit
Product.reset_pk_sequence # remise de l'id à 1 pour table produit
Market.delete_all # suppression de la table market
Market.reset_pk_sequence # remise de l'id à 1 pour table market

csv_text = File.read(Rails.root.join('lib', 'seeds', 'franceagri.csv'))
#csv = CSV.parse(csv_text.scrub, headers: true)
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
market_name = nil
product_name = nil

csv.each do |row|
    if   market_name != row['marche']
    then market_name = row['marche'].downcase
         Market.create(name: market_name)
    end
end
puts "There are now #{Market.count} rows in the Market table"

# Récupération de toutes les données présentes en table
markets = Market.all

#Boucle sur la liste des produits et creation du produit si absent en base
csv.each do |row|
    market_name = row['marche'].downcase
    market = Market.find_by name: market_name 
    if market == nil
        puts "create new market #{market_name}"
        Market.create(name: market_name)
    else
        if  product_name != row['produit']
            product_name = row['produit'].downcase
            check_product = market.products.exists?(name: product_name)
            if check_product == false
                market.products.create(name: product_name)
                #puts "Added #{product_name} to #{market_name}"
            end
        end
    end
end

puts "There are now #{Product.count} rows in the Product table"