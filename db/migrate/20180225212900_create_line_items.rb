class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.text :notes

      t.timestamps
    end
  end
end
