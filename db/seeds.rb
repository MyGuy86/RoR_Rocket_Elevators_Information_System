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

record = Address.first.id
counter = 0
45.times do
    user = User.create(
        email: Faker::Internet.email,
        password: 'password',
    )
    Customer.create!(
        user: user,
        customer_creation_date: Faker::Date.between(3.years.ago, Date.today),
        company_name: (Faker::Company.name + Faker::Company.suffix),
        address_id: record + counter,
        contact_full_name: Faker::Name.unique.name,
        company_contact_phone: Faker::PhoneNumber.cell_phone,
        company_contact_email: Faker::Internet.email,
        service_tech_full_name: Faker::Name.unique.name,
        service_tech_phone: Faker::PhoneNumber.cell_phone,
        tech_manager_email: Faker::Internet.email
    )
    counter += 1
end
puts "//***************Customer Table seeded with #{Customer.count} records*****************"
Customer.all.each do |cust|
rand(1..4).times do
    Building.create!(
        customer: cust,
        address_id: record + counter,
        admin_full_name: Faker::Name.unique.name,
        admin_email: Faker::Internet.email,
        admin_phone: Faker::PhoneNumber.cell_phone,
        tech_contact_full_name: Faker::Name.unique.name,
        tech_contact_email: Faker::Internet.email,
        tech_contact_phone: Faker::PhoneNumber.cell_phone,
    )
    counter += 1
    end
end


require 'csv'
	csvfile = File.read(Rails.root.join('lib', 'seeds','EmployeeList.csv'))
	# csvfile = File.read(Rails.root.join('lib', 'EmployeeList.csv'))

	table = CSV.parse(csvfile, headers: true)
	table.each do |row|
    	
    	user = User.create(
        	email: row['email'],
       		password: 'password',
    	)
	
		Employee.create!(
			user: user,
        	last_name: row['last_name'],
        	title: row['title'],
        	first_name: row['first_name'],
        	email: row['email'],
    	)
    	AdminUser.create(
        	email: row['email'],
        	password: 'password',
    	)
end


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

# require 'faker'
# 50.times do
# 	Building.create!(
# 		t.bigint "address_id"
# 		t.bigint "customers_id"
# 		t.string "FullNameOfBuildingAdmin"
# 		t.string "EmailOfAdminOfBuilding"
# 		t.integer "PhoneNumOfBuildingAdmin"
# 		t.string "FullNameOfTechContactForBuilding"
# 		t.string "TechContactEmailForBuilding"
# 		t.integer "TechContactPhoneForBuilding"
# 		t.datetime "created_at", null: false
# 		t.datetime "updated_at", null: false
# 		t.index ["address_id"], name: "index_buildings_on_address_id"
# 		t.index ["customers_id"], name: "index_buildings_on_customers_id"
# 	)
# 	Building_Detail.create!(
# 		t.bigint "buildings_id"
# 		t.string "InformationKey"
# 		t.string "Value"
# 		t.datetime "created_at", null: false
# 		t.datetime "updated_at", null: false
# 		t.index ["buildings_id"], name: "index_building_details_on_buildings_id"
# 	)

# 	Battery.create!(
# 		t.bigint "employees_id"
# 		t.bigint "buildings_id"
# 		t.string "Type"
# 		t.string "Status"
# 		t.date "CommissionDate"
# 		t.date "LastInspectionDate"
# 		t.string "OperationsCert"
# 		t.text "Information"
# 		t.text "Notes"
# 		t.datetime "created_at", null: false
# 		t.datetime "updated_at", null: false
# 		t.index ["buildings_id"], name: "index_batteries_on_buildings_id"
# 		t.index ["employees_id"], name: "index_batteries_on_employees_id"
# 	)

# 	Column.create!(
# 		t.bigint "batteries_id"
# 		t.string "Type"
# 		t.integer "NumOfFloorsServed"
# 		t.string "Status"
# 		t.text "Information"
# 		t.text "Notes"
# 		t.datetime "created_at", null: false
# 		t.datetime "updated_at", null: false
# 		t.index ["batteries_id"], name: "index_columns_on_batteries_id"
# 	)

# 	Elevator.create!(
# 		t.bigint "columns_id"
# 		t.integer "SerialNumber"
# 		t.string "Model"
# 		t.string "Type"
# 		t.string "Status"
# 		t.date "CommisionDate"
# 		t.date "LastInspectionDate"
# 		t.string "InspectionCert"
# 		t.text "Information"
# 		t.text "Notes"
# 		t.datetime "created_at", null: false
# 		t.datetime "updated_at", null: false
# 		t.index ["columns_id"], name: "index_elevators_on_columns_id"
# 	)



