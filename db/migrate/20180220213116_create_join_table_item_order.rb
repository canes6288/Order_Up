class CreateJoinTableItemOrder < ActiveRecord::Migration[5.0]
  def change
    create_join_table :items, :orders do |t|
      t.index [:item_id, :order_id]
    end
  end
end
