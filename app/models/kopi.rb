class Kopi < ApplicationRecord
  belongs_to :origin
  belongs_to :roast
  belongs_to :user

  has_many :order
end