require 'rails_helper'

feature 'Recap' do
	context 'when a user arrives at restaurants#recap' do
		scenario 'no orders have been created ever' do
			user = create(:user)
			restaurant = create(:restaurant)

			sign_in(user)

			visit recap_restaurant_path(restaurant)
			expect(page).to have_content('Recap')
		end

		scenario 'the completed orders are separated by day' do
			user = create(:user)
			restaurant = create(:restaurant)
			item1 = create(:item, restaurant: restaurant)
			item2 = create(:item, restaurant: restaurant)
			item3 = create(:item, restaurant: restaurant)

			order = create(:order, :completed, restaurant: restaurant)
			line_item1 = create(:line_item, item: item1, order: order)
			line_item2 = create(:line_item, item: item2, order: order)
			line_item3 = create(:line_item, item: item3, order: order)

			order2 = create(:order, :completed, restaurant: restaurant, created_at: 1.day.ago)
			line_item4 = create(:line_item, item: item2, order: order2)
			line_item5 = create(:line_item, item: item3, order: order2)

			# Cancelled order does not affect the total, should only be order2's total
			# in yesterday's total
			order3 = create(:order, :cancelled, restaurant: restaurant, created_at: 1.day.ago)
			line_item6 = create(:line_item, item: item2, order: order3)
			line_item7 = create(:line_item, item: item3, order: order3)

			sign_in(user)

			visit recap_restaurant_path(restaurant)
			
			todays_date = Time.current
											.in_time_zone('Eastern Time (US & Canada)')
											.strftime('%m/%d/%Y')
			todays_recap_table = find_section(todays_date)
			expect(page).to have_selector(todays_recap_table)

			within todays_recap_table do
				expect(page).to have_content(order.total)
			end

			yesterdays_date = 1.day.ago
													.in_time_zone('Eastern Time (US & Canada)')
													.strftime('%m/%d/%Y')
			yesterdays_recap_table = find_section(yesterdays_date)
			expect(page).to have_selector(yesterdays_recap_table)

			within yesterdays_recap_table do
				expect(page).to have_content(order2.total)
			end
		end
	end
end