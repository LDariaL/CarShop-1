class Cart < ApplicationRecord
    belongs_to :user,  optional: true
    has_many :positions
    has_many :items, through: :positions

#has_and_belongs_to_many :items  (if we have carts_items table)
end
