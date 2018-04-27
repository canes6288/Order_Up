class LineItem < ApplicationRecord
	belongs_to :order
	belongs_to :item, -> { with_deleted }

	delegate :name, :price, to: :item
end
