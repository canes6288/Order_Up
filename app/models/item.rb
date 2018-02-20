class Item < ApplicationRecord
	belongs_to :restaurant
	has_and_belongs_to_many :orders
end
