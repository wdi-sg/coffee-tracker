class Kopi < ApplicationRecord
  belongs_to :roast
  belongs_to :origin
  belongs_to :user
  has_and_belongs_to_many :orders
  has_and_belongs_to_many :customers
end