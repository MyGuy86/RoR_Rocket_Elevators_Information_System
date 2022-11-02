# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#load and parse json file
address_text = File.read(Rails.root.join('lib', 'seeds', 'address.json'));
address_parse = JSON.parse(address_text);
#create random array
randomarray = Array.new(address_parse['addresses'].count - 1) {|e| e += 1};
arandom = randomarray.shuffle;
address_counter = 0;



require 'csv'
	CSV.foreach("lib/EmployeeList.csv", :quote_char => "|",headers: true,encoding:"ISO-8859-1:utf-8") do |row|
		Employee.create!(row.to_hash)
	end



AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

require 'csv'
csvfile = File.read(Rails.root.join('lib', 'seeds', 'EmployeeList.csv'))
# CSV.read("EmployeeList.csv")
table = CSV.parse(csvfile, headers: true)
table.each do |row|
   EmployeeList.create!(
        first_name: Faker::FunnyName.name,
        last_name: row['last_name'],
        title: row['title'],
        email: row['email'],
#     )
# # end







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
# puts "*(*******************seededlead:db ********************* "




# # Quote.all.each do |q|
# 	if building_type == "residential"
# 		number_of_apartments1 = Faker::Number.between(from: 40, to: 350)
# 		number_of_floors1 = Faker::Number.number(digits: 2)
# 		number_of_businesses1 = 'null'
# 		number_of_basements1 = 'null'
# 		number_of_parking1 = 'null'
# 		number_of_cages1 = 'null'
# 		number_of_occupants1 = 'null'
# 		number_of_hours1 = 'null'
	
# 	end
	
	# building_type: ["residential", "corporate", "hybrid", "commercial"].sample,
	# service_quality:["standard", "premium", "excelium"].sample, 
   
	require 'faker'
	# 50.times do
	# 	Quote.create!(
		# building_type: ["residential", "corporate", "hybrid", "commercial"].sample,
		# service_quality:["standard", "premium", "excelium"].sample, 	
		# if building_type == "residential" 
		# 	number_of_apartments1 = Faker::Number.between(from: 40, to: 350)
		# 	number_of_floors1 = Faker::Number.number(digits: 2)
		# 	number_of_businesses1 = 'null'
		# 	number_of_basements1 = Faker::Number.number(digits: 2)
		# 	number_of_parking1 = 'null'
		# 	number_of_cages1 = 'null'
		# 	number_of_occupants1 = 'null'
		# 	number_of_hours1 = 'null'
		# 	number_of_elevators_needed= Faker::Number.number(digits: 2)
    	# 	price_per_unit= Faker::Number.decimal(l_digits: 2)
   		# 	elevator_price= Faker::Number.decimal(l_digits: 3, r_digits: 2)
    	# 	installation_fee= Faker::Number.decimal(l_digits: 3, r_digits: 2)
   		# 	final_price= Faker::Number.decimal(l_digits: 4, r_digits: 2)
		# end
		

	
		# if building_type == "corporate" 
		# 	number_of_apartments= 'null'
		# 	number_of_floors= Faker::Number.number(digits: 2),
		# 	number_of_businesses= Faker::Number.number(digits: 3),
		# 	number_of_basements= Faker::Number.non_zero_digit ,
		# 	number_of_parking= Faker::Number.number(digits: 3),
		# 	number_of_cages= 'null',
		# 	number_of_occupants= 'null',
		# 	number_of_hours= 'null',
		# 	number_of_elevators_needed= 'null'
		# 	price_per_unit= Faker::Number.decimal(l_digits: 2) 
		# 	elevator_price= Faker::Number.decimal(l_digits: 3, r_digits: 2)
		# 	installation_fee= Faker::Number.decimal(l_digits: 3, r_digits: 2)
		# 	final_price= Faker::Number.decimal(l_digits: 4, r_digits: 2)
		# end 

		# if building_type == "commercial"
		# 	number_of_apartments= 'null'
		# 	number_of_floors= Faker::Number.number(digits: 2),
		# 	number_of_businesses= Faker::Number.number(digits: 3),
		# 	number_of_basements= Faker::Number.non_zero_digit ,
		# 	number_of_parking= Faker::Number.number(digits: 3),
		# 	number_of_cages= 'null',
		# 	number_of_occupants= 'null',
		# 	number_of_hours= 'null',
		# 	number_of_elevators_needed= 'null'
		# 	price_per_unit= Faker::Number.decimal(l_digits: 2) 
		# 	elevator_price= Faker::Number.decimal(l_digits: 3, r_digits: 2)
		# 	installation_fee= Faker::Number.decimal(l_digits: 3, r_digits: 2)
		# 	final_price= Faker::Number.decimal(l_digits: 4, r_digits: 2)
		# end 

		# if building_type == "hybrid"
		# 	number_of_apartments= 'null'
		# 	number_of_floors= Faker::Number.number(digits: 2)
		# 	number_of_businesses= Faker::Number.number(digits: 3)
		# 	number_of_basements= Faker::Number.non_zero_digit 
		# 	number_of_parking= Faker::Number.number(digits: 3)
		# 	number_of_cages= 'null'
		# 	number_of_occupants= Faker::Number.number(digits: 3)
		# 	number_of_hours= Faker::Number.between(from: 1, to: 24)
		# 	number_of_elevators_needed= Faker::Number.number(digits: 2)
		# 	price_per_unit= Faker::Number.decimal(l_digits: 2) 
		# 	elevator_price= Faker::Number.decimal(l_digits: 3, r_digits: 2)
		# 	installation_fee= Faker::Number.decimal(l_digits: 3, r_digits: 2)
		# 	final_price= Faker::Number.decimal(l_digits: 4, r_digits: 2)



	
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


puts "*(*******************seededquote:db ********************* "
