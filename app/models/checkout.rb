class Checkout < ApplicationRecord
    belongs_to :book
    belongs_to :patron, foreign_key: :patron_id, class_name: 'User'
end