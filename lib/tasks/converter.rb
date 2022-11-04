require 'pg'
require 'mysql2'



# def leadsconvert
    Lead.all.each do |l|
        FactContact.create!(
        {
            ContactID: l.id,
            CreationDate: l.created_at,
            CompanyName: l.Bussiness_name,
            Email: l.Email,
            ProjectName: l.Project_name,
        }
    )
    end

# end
# leadsconvert;
# def quotesconvert
    Quote.all.each do |q|
        FactQuote.create!(
#             {
                QuoteID: q.id,
                Creation: q.created_at,
                NbElevator: q.number_of_elevators_needed,
#             }

#             CompanyName: l.Bussiness_name,
#             Email: l.Email,

        )
    end
# end
# def customersconvert
#     Customer.all.each do |c|
#         CustomerContact.create!(
#             {
#             CreationDate: c.date,
#             CompanyName: c.CompanyName,
#             FullNameOfCompanyMainContact: c.FullNameOfCompanyContact,
#             EmailOfCompanyMainContact: c.CompanyContactEMail,
#             CustomerCity:c.CompanyHQAdress
#             }
#         )

#             q.NbElevators: 
#     end
# end
# def elevatorsconvert
#     Elevator.all.each do |e|
#         ElevatorContact.create!(
#             serial_number: e.SerialNumber
#             date_of_commissioning: e.CommisionDate
#         )
#             building_id: 
#             customer_id:
#             building_city:
#     end
# end

    
=======
# end

