require 'csv'

puts 'Start inserting seed "Prices" ...'

#Init variables
market_name = nil
product_name = nil
price_data = nil

#Read csv file
csv_text = File.read(Rails.root.join('lib', 'seeds', 'franceagri.csv'))
#csv = CSV.parse(csv_text.scrub, headers: true)
csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')

#Boucle sur la liste des produits et ajouts des caractéristiques
csv.each do |row|
    market_name = row['marche'].downcase
    market = Market.find_by name: market_name 
    if market == nil
        puts "create new Market #{market_name}"
        Market.create(name: market_name)
    else
        product_name = row['produit'].downcase
        product = market.products.find_by name: product_name 
        if product == nil
            puts "create new Product #{product_name}"
            Product.create(name: product_name)
        else
            price_data = row['prix']
            check_price = product.prices.exists?(price: price_data)
            if check_price == false
                product.prices.create(price: price_data)
            end
        end
    end
    

end

puts "There are now #{Price.count} rows in the Price table"