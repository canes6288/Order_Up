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
end