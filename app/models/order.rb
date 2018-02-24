class Order < ApplicationRecord
	has_many :restaurants
	has_and_belongs_to_many :items
	accepts_nested_attributes_for :items

	SECTION = ['A', 'B', 'C', 'D', 'E']
end
