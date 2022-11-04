require 'pg'
require 'mysql'
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