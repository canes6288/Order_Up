class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
