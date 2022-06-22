class Checkout < ApplicationRecord
    belongs_to :book
    belongs_to :patron
end