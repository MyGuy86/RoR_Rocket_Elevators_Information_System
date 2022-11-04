require 'pg'
require 'mysql2'
def leadsconvert
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
end
leadsconvert();
def quotesconvert
    Quote.all.each do |q|
        lead = Lead.find(q.id)
        factquote=FactQuote.create!(
            {
                QuoteID: q.id,
                NbElevator: q.number_of_elevators_needed,
                Creation: lead.Creation_date,
                CompanyName: lead.Bussiness_name,
                Email: lead.Email,

            }
        )
        
    end
end
quotesconvert();

def customersconvert
    Customer.all.each do |c|
        Building.all.each do 
            Battery.all.each do
                Column.all.each do 
                    Elevator.all.each do 
                        
                        

        DimCustomer.create!(
            {
            CreationDate: c.date,
            CompanyName: c.CompanyName,
            FullNameOfCompanyMainContact: c.FullNameOfCompanyContact,
            EmailOfCompanyMainContact: c.CompanyContactEMail,
            CustomerCity:c.CompanyHQAdress
            })
            NbElevators
        )

#     end
# end
# customersconvert;
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
# elevatorsconvert;





