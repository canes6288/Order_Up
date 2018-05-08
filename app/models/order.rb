class Order < ApplicationRecord
	acts_as_paranoid

	belongs_to :restaurant
	has_many :line_items
	has_many :items, through: :line_items
	accepts_nested_attributes_for :items, allow_destroy: true

	validates_presence_of :restaurant_id
	validates_presence_of :section
	validates_presence_of :seat

	before_save :set_location
	before_save :set_number
	after_commit :broadcast_order, on: :create

	scope :completed, -> { only_deleted.where(cancelled: [nil, false]) }

	SECTION = ['A', 'B', 'C', 'D', 'E']

	def cancel
		update(cancelled: true)
	end

	def total
		items.pluck(:price).sum
	end

	private

		def broadcast_order
			html = ApplicationController.render(
				partial: 'orders/order', 
				locals: { order: self }
			)

		  ActionCable.server.broadcast "order_channel", { html: html }
		end

		def set_location
			self.location = ['A', 'B', 'C'].include?(section) ? 'BREW' : 'COMD'
		end

		def set_number
			last_order_id = Order.last&.id || 0
			order_number = last_order_id.to_s.last(3).to_i
			self.number = order_number
		end
end
