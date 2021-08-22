require 'csv'

puts 'Start inserting seed "characteristics" ...'

#Init variables
product_name = nil
unit_characteristic = nil
origine_characteristic = nil
certification_characteristic = nil

#Read csv file
csv_text = File.read(Rails.root.join('lib', 'seeds', 'franceagri.csv'))
#csv = CSV.parse(csv_text.scrub, headers: true)
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

#Boucle sur la liste des produits et ajouts des caractéristiques
csv.each do |row|
    product_name = row['produit'].downcase
    product = Product.find_by name: product_name 
    if product == nil
        puts "create new Product #{product_name}"
        Product.create(name: product_name)
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

puts "There are now #{Characteristic.count} rows in the Characteristic table"