class Kopi < ApplicationRecord
    belongs_to :farm
    belongs_to :roast
    has_many :order
    has_many :customers, through: :stocks
end
