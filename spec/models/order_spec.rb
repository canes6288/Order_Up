require 'rails_helper'

describe Order do
	describe '.compeleted' do
		it 'returns only completed orders' do
			restaurant = create(:restaurant)
			incomplete = create(:order, restaurant: restaurant)
			completed = create(:order, :completed)

			expect(Order.completed).to eq([completed])
		end
	end
end