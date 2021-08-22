require 'csv'

puts 'Start inserting seed "markets" ...'

#Init variable
market_name = nil

#Read csv file
csv_text = File.read(Rails.root.join('lib', 'seeds', 'franceagri.csv'))
#csv = CSV.parse(csv_text.scrub, headers: true)
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

#Insert market in table
csv.each do |row|
    if   market_name != row['marche']
    then market_name = row['marche'].downcase
         Market.create(name: market_name)
    end
end
puts "There are now #{Market.count} rows in the Market table"