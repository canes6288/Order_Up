# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Restaurant.delete_all
Order.delete_all
Item.delete_all

##################
#     USERS      #
##################

user = User.create(
		email: 'joe@aol.com',
		password: 'password',
	)

########################
#     RESTAURANTS      #
########################

restaurant = Restaurant.create(
		name: 'Joey Bag of Donuts',
	)

##################
#     ORDERS     #
##################

order = Order.create(
		number: 111,
		location: 'BREW',
		section: 'B',
		restaurant_id: restaurant.id,
		user_id: user.id,
		seat: 5,
	)

##################
#     ITEMS      #
##################

item_1 = Item.create(
		name: 'Pretzels and Cheese',
		price: 3.99,
		restaurant_id: restaurant.id,
	)

item_2 = Item.create(
		name: 'Baklava',
		price: 2.99,
		restaurant_id: restaurant.id,
	)

item_3 = Item.create(
		name: 'Ham',
		price: 12.99,
		restaurant_id: restaurant.id,
	)

#######################
#     LINE ITEMS      #
#######################

LineItem.create(order: order, item: item_1, notes: 'No salt on the pretzel')
LineItem.create(order: order, item: item_2, notes: nil)
LineItem.create(order: order, item: item_3, notes: nil)