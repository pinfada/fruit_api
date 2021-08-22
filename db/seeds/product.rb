require 'csv'

puts 'Start inserting seed "products" ...'

#Init variables
market_name = nil
product_name = nil

#Read csv file
csv_text = File.read(Rails.root.join('lib', 'seeds', 'franceagri.csv'))
#csv = CSV.parse(csv_text.scrub, headers: true)
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

#Boucle sur la liste des produits et creation du produit si absent en base
csv.each do |row|
    market_name = row['marche'].downcase
    market = Market.find_by name: market_name 
    if market == nil
        puts "create new market #{market_name}"
        Market.create(name: market_name)
    else
        product_name = row['produit'].downcase
        check_product = market.products.exists?(name: product_name)
        if check_product == false
            market.products.create(name: product_name)
            #puts "Added #{product_name} to #{market_name}"
        end
    end
end

puts "There are now #{Product.count} rows in the Product table"
