require 'csv'

puts 'Start inserting seed "characteristics" ...'

#Init variables
market_name = nil
product_name = nil
unit_characteristic = nil
origine_characteristic = nil
certification_characteristic = nil

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
            puts "create new Product #{market_name} | #{product_name}"
            market.products.create(name: product_name)
        else
            unit_characteristic = row['unit']
            origine_characteristic = row['origine']
            certification_characteristic = row['certification']
            check_characteristic = product.characteristics.exists?(unit: unit_characteristic, origine: origine_characteristic, certification: certification_characteristic)
            if check_characteristic == false
                product.characteristics.create(unit: unit_characteristic, origine: origine_characteristic, certification: certification_characteristic)
                #puts "Added #{unit_characteristic} , #{origine_characteristic}, #{certification_characteristic} to #{product_name}"
            end
        end
    end
end

puts "There are now #{Characteristic.count} rows in the Characteristic table"