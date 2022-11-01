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

