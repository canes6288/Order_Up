require 'rails_helper'

feature 'Recap' do
	context 'when a user arrives at restaurants#recap' do
		scenario 'the completed orders are separated by day' do
			user = create(:user)
			restaurant = create(:restaurant)
			item1 = create(:item, restaurant: restaurant)
			item2 = create(:item, restaurant: restaurant)
			item3 = create(:item, restaurant: restaurant)
			order = create(:order, :completed, restaurant: restaurant)
			order2 = create(:order, :completed, restaurant: restaurant, created_at: 1.day.ago)
			line_item1 = create(:line_item, item: item1, order: order)
			line_item2 = create(:line_item, item: item2, order: order)
			line_item3 = create(:line_item, item: item3, order: order)
			line_item4 = create(:line_item, item: item2, order: order2)
			line_item5 = create(:line_item, item: item3, order: order2)

			sign_in(user)

			visit recap_restaurant_path(restaurant)
			
			todays_date = Time.current.strftime('%m/%d/%Y')
			todays_recap_table = find_section(todays_date)
			expect(page).to have_selector(todays_recap_table)

			within todays_recap_table do
				expect(page).to have_content(order.total)
			end

			yesterdays_date = 1.day.ago.strftime('%m/%d/%Y')
			yesterdays_recap_table = find_section(yesterdays_date)
			expect(page).to have_selector(yesterdays_recap_table)

			within yesterdays_recap_table do
				expect(page).to have_content(order2.total)
			end
			# This test should include a cancelled or incomplete order, which
			# should not show up for that day on the recaps page
		end

		scenario 'each day has the correct order total' do
			# add a data-section to each table that equals the date
		end
	end
end