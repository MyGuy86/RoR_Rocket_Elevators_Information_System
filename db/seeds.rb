# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#load and parse json file
jsonFile = File.read(Rails.root.join('lib', 'Addresses.json'));
address_parse = JSON.parse(jsonFile);
#create random array
randomarray = Array.new(address_parse['addresses'].count - 1) {|e| e += 1};
arandom = randomarray.shuffle;
address_counter = 0;

(address_parse['addresses'].count -1).times do
	thisaddress = address_parse['addresses'][arandom[address_counter]]
	Address.create!(
		address_type: ["Home", "Business", "Shipping", "Billing"].sample,
		staus: ["verified", "unverified"].sample,
		entity: ["Business", "Personal"].sample,
		number_and_street: thisaddress["address1"],
		suite_or_apartment: thisaddress["address2"],
		city: thisaddress["city"],
		postal_code: thisaddress["postalCode"],
		country: "murica",
		notes: Faker::TvShows::SouthPark.quote
	)

	address_counter += 1

end

puts "//***********Address Table seeded with #{Address.count} records*********"


require 'faker'
100.times do 
	Lead.create!(
		 Full_name_of_the_contact: Faker::FunnyName.two_word_name,
		 Bussiness_name: Faker::Games::Fallout.character,
		 Email: Faker::Internet.free_email,
		 Phone: Faker::Number.number(digits: 10),
		 Project_name: Faker::JapaneseMedia::OnePiece.island,
		 Project_description: Faker::Movies::HarryPotter.quote,
		 Department_incharge: Faker::JapaneseMedia::Naruto.village,
		 Message: Faker::JapaneseMedia::OnePiece.quote,
		 Attached_file: "fix later",
	)
end 

# puts "*(*******************seededquote:db ********************* "
require 'faker'
50.times do
	Quote.create!(
		building_type: ["residential", "corporate", "hybrid", "commercial"].sample,
		service_quality:["standard", "premium", "excelium"].sample, 
		number_of_apartments: Faker::Number.between(from: 40, to: 350),
		number_of_floors: Faker::Number.number(digits: 2),
		number_of_businesses: Faker::Number.number(digits: 2),
		number_of_basements: Faker::Number.non_zero_digit, 
		number_of_parking: Faker::Number.number(digits: 3),
		number_of_cages: Faker::Number.number(digits: 2),
		number_of_occupants: Faker::Number.number(digits: 4),
		number_of_hours: Faker::Number.within(range: 1..24),
		number_of_elevators_needed: Faker::Number.number(digits: 2),
		price_per_unit: Faker::Number.decimal(l_digits: 2), 
		elevator_price: Faker::Number.decimal(l_digits: 3, r_digits: 2),
		installation_fee: Faker::Number.decimal(l_digits: 3, r_digits: 2),
		final_price: Faker::Number.decimal(l_digits: 4, r_digits: 2),

	)
end



