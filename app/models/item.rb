class Item < ApplicationRecord
	acts_as_paranoid

	belongs_to :restaurant
	has_many :line_items
	has_many :orders, through: :line_items

	validates_presence_of :name
	validates_presence_of :price

	def available?
		!sold_out?
	end
end
