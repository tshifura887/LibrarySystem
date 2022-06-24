class Book < ApplicationRecord
    has_and_belongs_to_many :authors
    has_and_belongs_to_many :patrons
    has_many :checkouts
end
