class Order < ApplicationRecord
	has_many :restaurants
	has_and_belongs_to_many :items
end
