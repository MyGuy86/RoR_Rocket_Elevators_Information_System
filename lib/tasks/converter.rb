require 'pg'
require 'mysql2'

# def leadconvert
Lead.all.each do |l|
  FactContact.create!(
    {
      ContactID: l.ContactID,
      CreationDate: l.CreationDate,
      CompanyName: l.CompanyName,
      Email: l.Email,
      ProjectName: l.ProjectName
    }
  )
end



# Quote.all.each do |q|
#   FactQuote.create!(
#     {
#       QuoteID: q.QuoteID,
#       CreationDate: q.Creation,
#       CompanyName: q.CompanyName,
#       Email: q.Email,
#       NbElevator: q.NbElevator
#     }
#   )
# end
#
# Customer.all.each do |c|
#   DimCustomers.create!(
#     {
#       CreationDate: c.CreationDate,
#       CompanyName: c.CompanyName,
#       FullNameOfCompanyMainContact: c.FullNameOfCompanyMainContact,
#       EmailOfCompanyMainContact: c.EmailOfCompanyMainContact,
#       NbElevators: c.NbElevators,
#       CustomerCity: c.CustomerCity
#     }
#   )
# end
#
# Elevator.all.each do |e|
#   FactElevator.create!(
#     {
#       SerialNumber: e.SerialNumber,
#       CreationDate: e.CreationDate,
#       CompanyName: e.CompanyName,
#       Email: e.Email,
#       ProjectName: e.ProjectName
#     }
#   )
# end
# end
