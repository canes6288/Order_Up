class Item < ApplicationRecord
	belongs_to :restaurant
	has_many :line_items
	has_many :orders, through: :line_items
end
