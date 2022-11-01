class Column < ApplicationRecord

    belong_to :battery
    has_many :Elevator

end
