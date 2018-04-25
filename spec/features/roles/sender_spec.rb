require 'rails_helper'

feature 'Sender' do
	# let!(:user) { create(:user) }
	# let!(:restaurant) { create(:restaurant) }
	# let!(:item_1) { create(:item, restaurant_id: restaurant.id) }
	# let!(:item_2) { create(:item, restaurant_id: restaurant.id) }
	# let!(:item_3) { create(:item, restaurant_id: restaurant.id) }

	xcontext 'when a Sender arrives to orders#new' do
		scenario 'the restaurant dropdown is visible', focus: true, js: true do
			user = create(:user)
			restaurant = create(:restaurant)
			create(:item, restaurant: restaurant)
			create(:item, restaurant: restaurant)
			create(:item, restaurant: restaurant)

			sign_in(user)

			## Select if you're a sender or a receiver
			# click_on 'Sender'
			## Choose a Restaurant
			# select(restaurant.name, from: 'order[restaurant_id]')
			
			## Select a Section
			select('A', from: 'order[section]')

			## Select a Seat number
			select(1, from: 'order[seat]')
			
			## Select 2 items from the menu
			find_first_action('add-item').click
			find_last_action('add-item').click

			expect(all('.row.sale-item').count).to eq(2)

			# save_and_open_page

			## Send order and check that an order is created on the backend
			# allow(Item).to receive(:all).and_return([item_1, item_2, item_3])

			click_on 'Send Order'

			expect(Order.count).to eq(1)

			# expect do
			# 	click_on 'Send Order'
			# end.to change(Order, :count).by(1)
		end
	end
end