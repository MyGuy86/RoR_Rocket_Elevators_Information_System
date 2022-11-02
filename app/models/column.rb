class Column < ApplicationRecord

    belongs_to :battery
    has_many :Elevator

end
