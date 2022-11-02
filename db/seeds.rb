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

require 'csv'
	csvfile = File.read(Rails.root.join('lib', 'EmployeeList.csv'))
	table = CSV.parse(csvfile, headers: true)
	table.each do |row|
    	Employee.create!(
        last_name: row['last_name'],
        title: row['title'],
        first_name: row['first_name'],
        email: row['email'],
    )
    User.create(
        email: row['email'],
        password: 'password',
    )
    AdminUser.create(
        email: row['email'],
        password: 'password',
    )
end
	

# require 'csv'
# csvfile = File.read(Rails.root.join('lib', 'seeds', 'EmployeeList.csv'))
# # CSV.read("EmployeeList.csv")
# table = CSV.parse(csvfile, headers: true)
# table.each do |row|
#    EmployeeList.create!(
#         first_name: Faker::FunnyName.name,
#         last_name: row['last_name'],
#         title: row['title'],
#         email: row['email'],
#     )
# end

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
 puts "*(*******************seededlead:db ********************* "

# Quote.create!(
# 	building_type: ['residential', 'corporate', 'hybrid', 'commercial'].sample,
#     service_quality:['standard', 'premium', 'excelium'].sample ,
#     number_of_apartments: "number_of_apartments",
#     number_of_floors: "number_of_floors",
#     number_of_businesses: "number_of_businesses",
#     number_of_basements: "number_of_basements",
#     number_of_parking: "number_of_parking",
#     number_of_cages: "number_of_cages",
#     number_of_occupants: "number_of_occupants",
#     number_of_hours:Faker::Number.within(range: 1..24),
#     number_of_elevators_needed:,
#     price_per_unit:,
#     elevator_price:,
#     installation_fee:,
#     final_price:,
# )

# end
