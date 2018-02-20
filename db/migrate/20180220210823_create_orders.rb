class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :number
      t.string :location
      t.integer :restaurant_id
      t.integer :user_id
      t.string :section
      t.integer :seat

      t.timestamps
    end
  end
end
