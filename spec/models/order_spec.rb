require 'rails_helper'

describe Order do
	describe '.compeleted' do
		it 'returns only completed, not-cancelled orders' do
			restaurant = create(:restaurant)
			incomplete = create(:order, restaurant: restaurant)
			cancelled = create(:order, :cancelled, restaurant: restaurant)
			completed = create(:order, :completed, restaurant: restaurant)

			expect(Order.completed).to eq([completed])
		end
	end
end