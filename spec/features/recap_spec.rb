require 'rails_helper'

feature 'Recap' do
	context 'when a user arrives at restaurants#recap' do
		scenario 'the completed orders are separated by day' do
			# add a data-section to each table that equals the date

			# This test should include a cancelled or incomplete order, which
			# should not show up for that day on the recaps page
		end

		scenario 'each day has the correct order total' do
			# add a data-section to each table that equals the date
		end
	end
end