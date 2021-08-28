require 'csv'

puts 'Start inserting seed "cotations" ...'

#Init variables
market_name = nil
product_name = nil
price_data = nil
productid = nil
priceid = nil
cotationdate = nil

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
            puts "Add new Product #{product_name} for #{market_name}"
            market.products.create(name: product_name)
        else
            price_data = row['prix']
            productid = product.id
            price = product.prices.find_by price: price_data 
            if  price == nil
                puts "Add new Price #{price_data} for #{product_name}"
                product.prices.create(price: price_data)
            else
                priceid = price.id
                cotationdate = row['date cotation']
                check_cotation = Cotation.exists?(cotation_date: cotationdate, product_id:productid, price_id: priceid)
                if  check_cotation == false
                    Cotation.create(cotation_date: cotationdate, product_id: productid, price_id: priceid)                   
                end
            end
        end
    end
end

puts "There are now #{Cotation.count} rows in the Cotation table"