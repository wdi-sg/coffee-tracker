class Kopi < ActiveRecord::Base
	belongs_to :origin
	belongs_to :seed
end
