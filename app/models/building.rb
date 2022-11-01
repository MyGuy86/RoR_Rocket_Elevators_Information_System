class Building < ApplicationRecord

    belong_to :address
    belong_to: customer
    has_many :battery
    has_one :building_detail

end
