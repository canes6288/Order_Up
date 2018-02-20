json.extract! order, :id, :number, :location, :restaurant_id, :user_id, :section, :seat, :created_at, :updated_at
json.url order_url(order, format: :json)
