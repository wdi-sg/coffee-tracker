class Customer < ApplicationRecord
  has_and_belongs_to_many :kopis

  belongs_to :user
end