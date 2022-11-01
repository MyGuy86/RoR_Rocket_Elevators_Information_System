class Battery < ApplicationRecord
    belong_to :employee
    belong_to :building
    has_many :column
end
