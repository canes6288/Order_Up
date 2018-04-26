require 'rails_helper'

feature 'Order' do
	xcontext 'when a user completes an order' do
		scenario 'the order is removed from orders#index' do
			user = create(:user)
			restaurant = create(:restaurant)
			item = create(:item, restaurant: restaurant)
			order = create(:order, restaurant: restaurant)
			line_item = create(:line_item, item: item, order: order)

			sign_in(user)

			visit restaurant_orders_path(restaurant)
			find_first_action('complete-order').click
			
			order.reload

			expect(order.cancelled?).to eq(false)
			expect(page).to_not have_content(order.total)
			expect(page).to have_content('Order completed')
			expect(Order.completed).to eq([order])
		end
	end

	context 'when a user cancels an order' do
		scenario 'the order is cancelled and removed from orders#index' do
			user = create(:user)
			restaurant = create(:restaurant)
			item = create(:item, restaurant: restaurant)
			order = create(:order, restaurant: restaurant)
			line_item = create(:line_item, item: item, order: order)

			sign_in(user)

			visit restaurant_orders_path(restaurant)
			click_on('Cancel Order')
			
			order.reload

			expect(order.cancelled?).to eq(true)
			expect(page).to_not have_content(order.total)
			expect(page).to have_content('Order cancelled')
			expect(Order.completed).to eq([])
		end
	end
end