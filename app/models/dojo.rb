class Dojo < ApplicationRecord
    validates :branch, :street, :city, length: { in: 2..255 }, presence: true
    validates :state, length: { is: 2 }, presence: true
end
