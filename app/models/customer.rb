class Customer < ApplicationRecord

    belong_to :user
    has_one :building
    belong_to :address
end
