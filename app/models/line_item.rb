class LineItem < ApplicationRecord
	belongs_to :order
	belongs_to :item, -> { with_deleted }
end
