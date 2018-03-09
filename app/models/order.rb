class Order < ApplicationRecord
	has_many :restaurants
	has_many :line_items
	has_many :items, through: :line_items
	accepts_nested_attributes_for :items, allow_destroy: true

	validates_presence_of :restaurant_id
	validates_presence_of :section
	validates_presence_of :seat

	before_save :set_location
	after_commit :broadcast_notification, on: :create


	SECTION = ['A', 'B', 'C', 'D', 'E']

	private

		def broadcast_notification
		  ActionCable.server.broadcast "order_channel", order_id: self.id
		end

		def set_location
			self.location = ['A', 'B', 'C'].include?(section) ? 'BREW' : 'COMD'
		end
end
