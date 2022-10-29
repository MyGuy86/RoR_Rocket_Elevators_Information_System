# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


	require 'csv'
	    CSV.foreach("app/models/Employee List - Employee List.csv", :quote_char => "|",headers: true,encoding:"ISO-8859-1:utf-8") do |row|
	        Employee.create!(row.to_hash)
	    end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

