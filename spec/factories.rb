FactoryBot.define do
	factory :item do
		name	{ Faker::Dessert.variety }
		price { Faker::Number.decimal(2) }
	end

	factory :restaurant do
		name { Faker::VentureBros.organization }
	end

	factory :user do
		email { Faker::Internet.email }
		password 'password'
	end

	factory :order do
		restaurant
		section 'A'
		seat '1'

		trait :completed do
			deleted_at Time.current
		end
	end
end