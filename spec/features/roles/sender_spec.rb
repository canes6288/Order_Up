require 'rails_helper'

feature 'Sender' do
	context 'when a Sender arrives to orders#new' do
		scenario 'the restaurant dropdown is visible' do
			user = FactoryBot.create(:user)
			restaurant = FactoryBot.create(:restaurant)
			item_1 = FactoryBot.create(:item)
			item_2 = FactoryBot.create(:item)
			item_3 = FactoryBot.create(:item)


			visit root_path
			click_on 'Login'
			fill_in "user[email]", with: user.email
			fill_in "user[password]", with: user.password
			click_on 'Log in'

			## Select if you're a sender or a receiver
			click_on 'Sender'

			## Choose a Restaurant
			select(restaurant.name, from: 'order[restaurant_id]')
			
			## Select a Section
			select('A', from: 'order[section]')

			## Select a Seat number
			select(rand(5..50), from: 'order[seat]')
			
			## Select items from the menu

			## Send order
			## Check that an order is created on the backend
		end
	end
end