class Customer < ApplicationRecord

    # belongs_to :user
    has_one :building
    belongs_to :address
end
